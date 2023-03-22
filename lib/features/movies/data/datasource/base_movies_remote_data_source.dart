import 'package:watch_it/core/network/dio_helper.dart';
import 'package:watch_it/core/network/end_points.dart';
import 'package:watch_it/features/movies/data/model/get_credit_model.dart';
import 'package:watch_it/features/movies/data/model/movies_details_model.dart';
import 'package:watch_it/features/movies/data/model/movies_model.dart';
import 'package:watch_it/features/movies/data/model/search_model.dart';
import 'package:watch_it/features/movies/data/model/similar_movies_model.dart';
import 'package:watch_it/features/movies/data/model/trailer_model.dart';
import 'package:watch_it/features/movies/domain/repository/base_movies_repository.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesResultsModel>> getPopularMovies(PageParameters parameters);

  Future<List<MoviesResultsModel>> getTopRateMovies(PageParameters parameters);

  Future<List<MoviesResultsModel>> getNowPlayingMovies();

  Future<List<MoviesResultsModel>> getUpcomingMovies(PageParameters parameters);

  Future<MoviesDetailsModel> getPopularDetails(
      MoviesDetailsParameters parameters);

  Future<GetCreditModel> getCreditCast(MoviesDetailsParameters parameters);

  Future<List<ResultsModel>> getSimilarMovies(
      MoviesDetailsParameters parameters);

  Future<List<TrailerResultsModel>> getTrailerMovies(
      MoviesDetailsParameters parameters);

  Future<List<SearchResultsModel>> getSearch(SearchParameters parameters);
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  final DioHelper dioHelper;

  MoviesRemoteDataSource(this.dioHelper);

  @override
  Future<List<MoviesResultsModel>> getPopularMovies(
      PageParameters parameters) async {
    final response = await dioHelper.get(
      endPoint: popularEndPoint(
        'popular',
        parameters.page,
      ),
    );
    return List<MoviesResultsModel>.from(
      (response['results'] as List).map(
        (e) => MoviesResultsModel.fromJson(e),
      ),
    );
  }

  @override
  Future<List<MoviesResultsModel>> getTopRateMovies(
      PageParameters parameters) async {
    final response = await dioHelper.get(
      endPoint: topRatedEndPoint(
        'top_rated',
        parameters.page,
      ),
    );
    return List<MoviesResultsModel>.from(
      (response['results'] as List).map(
        (e) => MoviesResultsModel.fromJson(e),
      ),
    );
  }

  @override
  Future<List<MoviesResultsModel>> getNowPlayingMovies() async {
    final response = await dioHelper.get(
      endPoint: nowPlayingEndPoint(
        'now_playing',
        1,
      ),
    );
    return List<MoviesResultsModel>.from(
      (response['results'] as List).map(
        (e) => MoviesResultsModel.fromJson(e),
      ),
    );
  }

  @override
  Future<List<MoviesResultsModel>> getUpcomingMovies(
      PageParameters parameters) async {
    final response = await dioHelper.get(
      endPoint: upComingEndPoint(
        'upcoming',
        parameters.page,
      ),
    );
    return List<MoviesResultsModel>.from(
      (response['results'] as List).map(
        (e) => MoviesResultsModel.fromJson(e),
      ),
    );
  }

  @override
  Future<MoviesDetailsModel> getPopularDetails(
      MoviesDetailsParameters parameters) async {
    final response = await dioHelper.get(
      endPoint: movieDetailsPath(parameters.id),
    );

    return MoviesDetailsModel.fromJson(response);
  }

  @override
  Future<GetCreditModel> getCreditCast(
      MoviesDetailsParameters parameters) async {
    final response = await dioHelper.get(endPoint: creditsPath(parameters.id));

    return GetCreditModel.fromJson(response);
  }

  @override
  Future<List<ResultsModel>> getSimilarMovies(
      MoviesDetailsParameters parameters) async {
    final response = await dioHelper.get(
        endPoint: similarMoviesPath(
      parameters.id,
    ));

    return List<ResultsModel>.from(
        (response['results'] as List).map((e) => ResultsModel.fromJson(e)));
  }

  @override
  Future<List<TrailerResultsModel>> getTrailerMovies(
      MoviesDetailsParameters parameters) async {
    final response =
        await dioHelper.get(endPoint: trailerMoviesPath(parameters.id));

    return List<TrailerResultsModel>.from((response['results'] as List)
        .map((e) => TrailerResultsModel.fromJson(e)));
  }

  @override
  Future<List<SearchResultsModel>> getSearch(
      SearchParameters parameters) async {
    final response = await dioHelper.get(
      endPoint: searchEndPoint(
        'search',
         parameters.query,
      ),
    );
    return List<SearchResultsModel>.from((response['results'] as List)
        .map((e) => SearchResultsModel.fromJson(e)));
  }
}
