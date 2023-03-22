import 'package:equatable/equatable.dart';

class SimilarMovies extends Equatable {
  final int page;
  final List<Results> results;
  final int totalPages;
  final int totalResults;

  const SimilarMovies({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}

class Results extends Equatable {
  final bool adult;
  final dynamic backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final dynamic voteAverage;
  final int voteCount;

  const Results({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
    adult,
    backdropPath,
    genreIds,
    id,
    originalLanguage,
    originalTitle,
    overview,
    popularity,
    posterPath,
    releaseDate,
    title,
    video,
    voteAverage,
    voteCount,
  ];
}
