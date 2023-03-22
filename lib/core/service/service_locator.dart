import 'package:get_it/get_it.dart';
import 'package:watch_it/core/network/dio_helper.dart';
import 'package:watch_it/features/movies/data/datasource/base_movies_remote_data_source.dart';
import 'package:watch_it/features/movies/data/repository/movies_repository.dart';
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
import 'package:watch_it/features/movies/presentation/controller/cubit/movies_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator
{
  Future<void>init()async
  {
    sl.registerFactory(() => MoviesCubit(sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl()));

    sl.registerLazySingleton(() => GetSearchUseCase(sl()));

    sl.registerLazySingleton(() => GetTrailerMoviesUseCase(sl()));

    sl.registerLazySingleton(() => GetSimilarMoviesUseCase(sl()));


    sl.registerLazySingleton(() => GetCreditCastUseCase(sl()));

    sl.registerLazySingleton(() => GetPopularDetailsUseCas(sl()));

    sl.registerLazySingleton(() => GetUpcomingMoviesUseCase(sl()));

    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));

    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));

    sl.registerLazySingleton<BaseMoviesRepository>(
            () => MoviesRepository(sl()));

    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
            () => MoviesRemoteDataSource(sl()));

    sl.registerLazySingleton<DioHelper>(
            () => DioHelperImpl());
  }
}