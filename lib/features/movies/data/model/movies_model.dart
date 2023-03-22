import 'package:watch_it/features/movies/domain/entities/movies.dart';

class MoviesModel extends Movies {
  const MoviesModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    List<MoviesResultsModel>results = [];
    if(json['results'] != null){
      json['results'].forEach((element)
      {
        results.add(MoviesResultsModel.fromJson(element));
      });
    }
    return MoviesModel(
      page: json['page'],
      results: results,
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class MoviesResultsModel extends MoviesResults {
  const MoviesResultsModel({
    required super.adult,
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MoviesResultsModel.fromJson(Map<String, dynamic> json) {
    return MoviesResultsModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids']),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}
