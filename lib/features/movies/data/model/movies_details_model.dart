import 'package:watch_it/features/movies/domain/entities/movies_details.dart';

class MoviesDetailsModel extends MoviesDetails {
  const MoviesDetailsModel({
    required super.adult,
    required super.backdropPath,
    //required super.belongsToCollection,
    required super.budget,
    required super.genres,
    required super.homepage,
    required super.id,
    required super.imdbId,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.productionCompanies,
    required super.productionCountries,
    required super.releaseDate,
    required super.revenue,
    required super.runtime,
    required super.spokenLanguages,
    required super.status,
    required super.tagline,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MoviesDetailsModel.fromJson(Map<String, dynamic> json) {
    List<GenresModel>genres = [];
    if(json['genres'] != null){
      json['genres'].forEach((element)
      {
        genres.add(GenresModel.fromJson(element));
      });
    }
    List<ProductionCompaniesModel>production_companies = [];
    if(json['production_companies'] != null){
      json['production_companies'].forEach((element)
      {
        production_companies.add(ProductionCompaniesModel.fromJson(element));
      });
    }
    List<ProductionCountriesModel>production_countries = [];
    if(json['production_countries'] != null){
      json['production_countries'].forEach((element)
      {
        production_countries.add(ProductionCountriesModel.fromJson(element));
      });
    }
    List<SpokenLanguagesModel>spoken_languages = [];
    if(json['spoken_languages'] != null){
      json['spoken_languages'].forEach((element)
      {
        spoken_languages.add(SpokenLanguagesModel.fromJson(element));
      });
    }
    return MoviesDetailsModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      // belongsToCollection: BelongsToCollectionModel.fromJson(json['belongsToCollection']),
      budget: json['budget'],
      genres: genres,
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      productionCompanies: production_companies,
      productionCountries: production_countries,
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: spoken_languages,
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}

// class BelongsToCollectionModel extends BelongsToCollection {
//   const BelongsToCollectionModel({
//     required super.id,
//     required super.name,
//     required super.posterPath,
//     required super.backdropPath,
//   });
//
//   factory BelongsToCollectionModel.fromJson(Map<String, dynamic> json) {
//     return BelongsToCollectionModel(
//       id: json['id'],
//       name: json['name'],
//       posterPath: json['poster_path'],
//       backdropPath: json['backdrop_path'],
//     );
//   }
// }

class GenresModel extends Genres {
  const GenresModel({
    required super.id,
    required super.name,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ProductionCompaniesModel extends ProductionCompanies {
  const ProductionCompaniesModel({
    required super.id,
    required super.logoPath,
    required super.name,
    required super.originCountry,
  });

  factory ProductionCompaniesModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompaniesModel(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }
}

class ProductionCountriesModel extends ProductionCountries {
  const ProductionCountriesModel({
    required super.iso31661,
    required super.name,
  });

  factory ProductionCountriesModel.fromJson(Map<String, dynamic> json) {
    return ProductionCountriesModel(
      iso31661: json['iso_3166_1'],
      name: json['name'],
    );
  }
}

class SpokenLanguagesModel extends SpokenLanguages {
  const SpokenLanguagesModel({
    required super.englishName,
    required super.iso6391,
    required super.name,
  });

  factory SpokenLanguagesModel.fromJson(Map<String, dynamic> json) {
    return SpokenLanguagesModel(
      englishName: json['english_name'],
      iso6391: json['iso_639_1'],
      name: json['name'],
    );
  }
}
