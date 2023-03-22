import 'package:dartz/dartz.dart';
import 'package:watch_it/core/error/exception.dart';
import 'package:watch_it/core/error/failure.dart';
import 'package:watch_it/features/movies/data/datasource/base_movies_remote_data_source.dart';
import 'package:watch_it/features/movies/domain/entities/get_credit.dart';
import 'package:watch_it/features/movies/domain/entities/movies.dart';
import 'package:watch_it/features/movies/domain/entities/movies_details.dart';
import 'package:watch_it/features/movies/domain/entities/search.dart';
import 'package:watch_it/features/movies/domain/entities/simailr_movies.dart';
import 'package:watch_it/features/movies/domain/entities/trailer.dart';
import 'package:watch_it/features/movies/domain/repository/base_movies_repository.dart';

class MoviesRepository extends BaseMoviesRepository
{
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepository(this.baseMoviesRemoteDataSource);
  @override
  Future<Either<Failure, List<MoviesResults>>> getPopularMovies(PageParameters parameters) async{
    final result = await baseMoviesRemoteDataSource.getPopularMovies(parameters);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<MoviesResults>>> getTopRatedMovies(PageParameters parameters) async{
    final result = await baseMoviesRemoteDataSource.getTopRateMovies(parameters);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<MoviesResults>>> getNowPlayingMovies() async{
    final result = await baseMoviesRemoteDataSource.getNowPlayingMovies();

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<MoviesResults>>> getUpcomingMovies(PageParameters parameters) async{
    final result = await baseMoviesRemoteDataSource.getUpcomingMovies(parameters);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MoviesDetails>> getPopularDetails(MoviesDetailsParameters parameters)async {
    final result = await baseMoviesRemoteDataSource.getPopularDetails(parameters);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, GetCredit>> getCreditCast(MoviesDetailsParameters parameters)async {
    final result = await baseMoviesRemoteDataSource.getCreditCast(parameters);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Results>>> getSimilarMovies(MoviesDetailsParameters parameters)async {
    final result = await baseMoviesRemoteDataSource.getSimilarMovies(parameters);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<TrailerResults>>> getTrailerMovies(MoviesDetailsParameters parameters)async {
    final result = await baseMoviesRemoteDataSource.getTrailerMovies(parameters);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<SearchResults>>> getSearch(SearchParameters parameters)async {
    final result = await baseMoviesRemoteDataSource.getSearch(parameters);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

}