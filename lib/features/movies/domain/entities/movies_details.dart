import 'package:equatable/equatable.dart';

class MoviesDetails extends Equatable {
  final bool adult;
  final String backdropPath;
  final int budget;
  final List<Genres> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompanies> productionCompanies;
  final List<ProductionCountries> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguages> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final dynamic voteAverage;
  final int voteCount;

  const MoviesDetails({
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        budget,
        genres,
        homepage,
        id,
        imdbId,
        originalLanguage,
        originalTitle,
        popularity,
        posterPath,
        productionCompanies,
        productionCountries,
        releaseDate,
        revenue,
        runtime,
        spokenLanguages,
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}


class Genres extends Equatable {
  final int id;
  final String name;

  const Genres({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

class ProductionCompanies extends Equatable {
  final int id;
  final dynamic logoPath;
  final String name;
  final String originCountry;

  const ProductionCompanies({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  @override
  List<Object?> get props => [
        id,
        logoPath,
        name,
        originCountry,
      ];
}

class ProductionCountries extends Equatable {
  final String iso31661;
  final String name;

  const ProductionCountries({
    required this.iso31661,
    required this.name,
  });

  @override
  List<Object?> get props => [
        iso31661,
        name,
      ];
}

class SpokenLanguages extends Equatable {
  final String englishName;
  final String iso6391;
  final String name;

  const SpokenLanguages({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  @override
  List<Object?> get props => [
    englishName,
    iso6391,
    name,
  ];
}
