import 'package:watch_it/features/movies/domain/entities/get_credit.dart';
import 'package:watch_it/features/movies/domain/entities/movies.dart';
import 'package:watch_it/features/movies/domain/entities/movies_details.dart';
import 'package:watch_it/features/movies/domain/entities/search.dart';
import 'package:watch_it/features/movies/domain/entities/simailr_movies.dart';
import 'package:watch_it/features/movies/domain/entities/trailer.dart';

abstract class MoviesState{}

class InitialMoviesState extends MoviesState{}

class GetPopularMoviesLoadingState extends MoviesState{}
class GetPopularMoviesSuccessState extends MoviesState
{
  final List<MoviesResults>results;

  GetPopularMoviesSuccessState(this.results);
}
class GetPopularMoviesErrorState extends MoviesState
{
  final String error;

  GetPopularMoviesErrorState(this.error);
}


class GetMoviesTopRatedLoadingState extends MoviesState{}
class GetMoviesTopRatedSuccessState extends MoviesState
{
  final List<MoviesResults>results;

  GetMoviesTopRatedSuccessState(this.results);
}
class GetMoviesTopRatedErrorState extends MoviesState
{
  final String error;

  GetMoviesTopRatedErrorState(this.error);
}

class GetMoviesNowPlayingLoadingState extends MoviesState {}
class GetMoviesNowPlayingSuccessState extends MoviesState
{
  final List<MoviesResults>results;

  GetMoviesNowPlayingSuccessState(this.results);
}
class GetMoviesNowPlayingErrorState extends MoviesState
{
  final String error;

  GetMoviesNowPlayingErrorState(this.error);
}

class GetMoviesUpcomingLoadingState extends MoviesState{}
class GetMoviesUpcomingSuccessState extends MoviesState
{
  final List<MoviesResults>results;

  GetMoviesUpcomingSuccessState(this.results);
}
class GetMoviesUpcomingErrorState extends MoviesState
{
  final String error;

  GetMoviesUpcomingErrorState(this.error);
}

class GetMoviesPopularDetailsLoadingState extends MoviesState{}
class GetMoviesPopularDetailsSuccessState extends MoviesState{
  final MoviesDetails moviesDetails;

  GetMoviesPopularDetailsSuccessState(this.moviesDetails);
}
class GetMoviesPopularDetailsErrorState extends MoviesState
{
  final String error;

  GetMoviesPopularDetailsErrorState(this.error);
}

class GetCreditCaseLoadingState extends MoviesState{}
class GetCreditCaseSuccessState extends MoviesState{
  final GetCredit getCredit;

  GetCreditCaseSuccessState(this.getCredit);
}
class GetCreditCaseErrorState extends MoviesState
{
  final String error;

  GetCreditCaseErrorState(this.error);
}

class GetSimilarMoviesLoadingState extends MoviesState{}
class GetSimilarMoviesSuccessState extends MoviesState{
  final List<Results>results;

  GetSimilarMoviesSuccessState(this.results);
}
class GetSimilarMoviesErrorState extends MoviesState{
  final String error;

  GetSimilarMoviesErrorState(this.error);
}

class GetTrailerMoviesLoadingState extends MoviesState{}
class GetTrailerMoviesSuccessState extends MoviesState{
  final List<TrailerResults>results;

  GetTrailerMoviesSuccessState(this.results);
}
class GetTrailerMoviesErrorState extends MoviesState{
  final String error;

  GetTrailerMoviesErrorState(this.error);
}

class GetSearchLoadingState extends MoviesState{}
class GetSearchSuccessState extends MoviesState
{
  final List<SearchResults> results;

  GetSearchSuccessState(this.results);
}
class GetSearchErrorState extends MoviesState
{
  final String error;

  GetSearchErrorState(this.error);
}