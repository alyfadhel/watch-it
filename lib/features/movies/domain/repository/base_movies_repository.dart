import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_it/core/error/failure.dart';
import 'package:watch_it/features/movies/domain/entities/get_credit.dart';
import 'package:watch_it/features/movies/domain/entities/movies.dart';
import 'package:watch_it/features/movies/domain/entities/movies_details.dart';
import 'package:watch_it/features/movies/domain/entities/search.dart';
import 'package:watch_it/features/movies/domain/entities/simailr_movies.dart';
import 'package:watch_it/features/movies/domain/entities/trailer.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<MoviesResults>>> getPopularMovies(
      PageParameters parameters);

  Future<Either<Failure, List<MoviesResults>>> getTopRatedMovies(
      PageParameters parameters);

  Future<Either<Failure, List<MoviesResults>>> getNowPlayingMovies();

  Future<Either<Failure, List<MoviesResults>>> getUpcomingMovies(
      PageParameters parameters);

  Future<Either<Failure, MoviesDetails>> getPopularDetails(
      MoviesDetailsParameters parameters);

  Future<Either<Failure, GetCredit>> getCreditCast(
      MoviesDetailsParameters parameters);

  Future<Either<Failure, List<Results>>> getSimilarMovies(
      MoviesDetailsParameters parameters);

  Future<Either<Failure, List<TrailerResults>>> getTrailerMovies(
      MoviesDetailsParameters parameters);

  Future<Either<Failure,List<SearchResults>>>getSearch(SearchParameters parameters);
}

class PageParameters extends Equatable {
  final int page;

  const PageParameters({
    required this.page,
  });

  @override
  List<Object?> get props => [
        page,
      ];
}

class MoviesDetailsParameters extends Equatable {
  final int id;

  const MoviesDetailsParameters({
    required this.id,
  });

  @override
  List<Object?> get props => [];
}

class SearchParameters extends Equatable {
  final String query;

  const SearchParameters({
    required this.query,
  });

  @override
  List<Object?> get props => [];
}
