import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_it/core/usecase/base_usecase.dart';
import 'package:watch_it/features/movies/domain/entities/get_credit.dart';
import 'package:watch_it/features/movies/domain/entities/movies.dart';
import 'package:watch_it/features/movies/domain/entities/movies_details.dart';
import 'package:watch_it/features/movies/domain/entities/search.dart';
import 'package:watch_it/features/movies/domain/entities/simailr_movies.dart';
import 'package:watch_it/features/movies/domain/entities/trailer.dart';
import 'package:watch_it/features/movies/domain/repository/base_movies_repository.dart';
import 'package:watch_it/features/movies/domain/usecase/get_credit_cast_use_case.dart';
import 'package:watch_it/features/movies/domain/usecase/get_now_playing_movies_use_case.dart';
import 'package:watch_it/features/movies/domain/usecase/get_popular_details_use_case.dart';
import 'package:watch_it/features/movies/domain/usecase/get_popular_movies_use_case.dart';
import 'package:watch_it/features/movies/domain/usecase/get_search_use_case.dart';
import 'package:watch_it/features/movies/domain/usecase/get_similar_movies_use_case.dart';
import 'package:watch_it/features/movies/domain/usecase/get_top_rated_movies_use_case.dart';
import 'package:watch_it/features/movies/domain/usecase/get_trailer_movies_use_case.dart';
import 'package:watch_it/features/movies/domain/usecase/get_upcoming_movies_use_case.dart';
import 'package:watch_it/features/movies/presentation/controller/cubit/movise_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
    this.getNowPlayingMoviesUseCase,
    this.getUpcomingMoviesUseCase,
    this.getPopularDetailsUseCas,
    this.getCreditCastUseCase,
    this.getSimilarMoviesUseCase,
    this.getTrailerMoviesUseCase,
    this.getSearchUseCase,
  ) : super(InitialMoviesState());

  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetUpcomingMoviesUseCase getUpcomingMoviesUseCase;
  final GetPopularDetailsUseCas getPopularDetailsUseCas;
  final GetCreditCastUseCase getCreditCastUseCase;
  final GetSimilarMoviesUseCase getSimilarMoviesUseCase;
  final GetTrailerMoviesUseCase getTrailerMoviesUseCase;
  final GetSearchUseCase getSearchUseCase;
  List<SearchResults> searchResults = [];
  List<TrailerResults> trailerResults = [];
  List<Results> similarMovies = [];
  GetCredit? getCredit;
  List<MoviesResults> results = [];
  MoviesDetails? moviesDetails;

  static MoviesCubit get(context) => BlocProvider.of(context);

  int page = 1;
  ScrollController scrollController = ScrollController();
  bool isLoadMore = false;

  void getPopularMovies() async {
    emit(GetPopularMoviesLoadingState());

    final result = await getPopularMoviesUseCase(
      PageParameters(
        page: page,
      ),
    );

    debugPrint(result.toString());

    result.fold((l) {
      emit(GetPopularMoviesErrorState(l.message));
    }, (r) {
      results = r;
      scrollController.addListener(() {
        loadingMorePopular();
      });
      emit(GetPopularMoviesSuccessState(r));
    });
  }

  Future<void> loadingMorePopular() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isLoadMore = true;
      page++;
      final result = await getPopularMoviesUseCase(
        PageParameters(
          page: page,
        ),
      );
      result.fold(
        (l) => emit(
          GetPopularMoviesErrorState(l.message),
        ),
        (r) {
          results.addAll(r);
          emit(
            GetPopularMoviesSuccessState(r),
          );
        },
      );
    }
  }

/////////////////////////////////////////////////////////

  void getTopRatedMovies() async {
    emit(GetMoviesTopRatedLoadingState());

    final result = await getTopRatedMoviesUseCase(
      PageParameters(
        page: page,
      ),
    );

    debugPrint(result.toString());

    result.fold((l) {
      emit(GetMoviesTopRatedErrorState(l.message));
    }, (r) {
      results = r;
      scrollController.addListener(() {
        loadingMoreTopRated();
      });
      emit(GetMoviesTopRatedSuccessState(r));
    });
  }

  Future<void> loadingMoreTopRated() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isLoadMore = true;
      page++;
      final result = await getTopRatedMoviesUseCase(
        PageParameters(
          page: page,
        ),
      );
      result.fold(
        (l) => emit(
          GetMoviesTopRatedErrorState(l.message),
        ),
        (r) {
          results.addAll(r);
          emit(
            GetMoviesTopRatedSuccessState(r),
          );
        },
      );
    }
  }

///////////////////////////////////////////////////////////

  void getNowPlayingMovies() async {
    emit(GetMoviesNowPlayingLoadingState());

    final result = await getNowPlayingMoviesUseCase(const NoParameters());

    debugPrint(result.toString());

    result.fold((l) {
      emit(GetMoviesNowPlayingErrorState(l.message));
    }, (r) {
      results = r;
      emit(GetMoviesNowPlayingSuccessState(r));
    });
  }

///////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////

  void getUpcomingMovies() async {
    emit(GetMoviesUpcomingLoadingState());

    final result = await getUpcomingMoviesUseCase(
      PageParameters(
        page: page,
      ),
    );

    debugPrint(result.toString());

    result.fold((l) {
      emit(GetMoviesUpcomingErrorState(l.message));
    }, (r) {
      results = r;
      scrollController.addListener(() {
        loadingMoreUpcoming();
      });
      emit(GetMoviesUpcomingSuccessState(r));
    });
  }

  Future<void> loadingMoreUpcoming() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isLoadMore = true;
      page++;
      final result = await getUpcomingMoviesUseCase(
        PageParameters(
          page: page,
        ),
      );
      result.fold(
        (l) => emit(
          GetMoviesUpcomingErrorState(l.message),
        ),
        (r) {
          results.addAll(r);
          emit(
            GetMoviesUpcomingSuccessState(r),
          );
        },
      );
    }
  }

////////////////////////////////////////////////////////////

  void getMoviesPopularDetails({required int id}) async {
    emit(GetMoviesPopularDetailsLoadingState());
    final result = await getPopularDetailsUseCas(
      MoviesDetailsParameters(id: id),
    );

    result.fold((l) {
      emit(GetMoviesPopularDetailsErrorState(l.message));
    }, (r) {
      moviesDetails = r;
      emit(GetMoviesPopularDetailsSuccessState(r));
    });
  }

  /////////////////////////////////////////////////////////

  void getCreditCast({required int id}) async {
    emit(GetCreditCaseLoadingState());

    final result = await getCreditCastUseCase(MoviesDetailsParameters(id: id));

    result.fold((l) {
      emit(GetCreditCaseErrorState(l.message));
    }, (r) {
      getCredit = r;
      emit(GetCreditCaseSuccessState(r));
    });
  }

  ///////////////////////////////////////////////////////

  void getSimilarMovies({required int id}) async {
    emit(GetSimilarMoviesLoadingState());

    final result =
        await getSimilarMoviesUseCase(MoviesDetailsParameters(id: id));

    result.fold((l) {
      emit(GetSimilarMoviesErrorState(l.message));
    }, (r) {
      similarMovies = r;
      emit(GetSimilarMoviesSuccessState(r));
    });
  }

  ///////////////////////////////////////////////////////

  void getTrailerMovies({required int id}) async {
    emit(GetTrailerMoviesLoadingState());

    final result =
        await getTrailerMoviesUseCase(MoviesDetailsParameters(id: id));

    result.fold((l) {
      emit(GetTrailerMoviesErrorState(l.message));
    }, (r) {
      trailerResults = r;
      emit(GetTrailerMoviesSuccessState(r));
    });
  }

  /////////////////////////////////////////////////////////////

  var searchController = TextEditingController();
  void getSearch({required String query}) async {
    emit(GetSearchLoadingState());

    final result = await getSearchUseCase(
      SearchParameters(
        query: query,
      ),
    );

    result.fold(
            (l){
              emit(GetSearchErrorState(l.message));
            },
            (r){
              searchResults = r;
              emit(GetSearchSuccessState(r));
            });
  }
}
