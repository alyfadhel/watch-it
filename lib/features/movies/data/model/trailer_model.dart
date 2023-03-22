import 'package:watch_it/features/movies/domain/entities/trailer.dart';

class TrailerModel extends Trailer {
  const TrailerModel({
    required super.id,
    required super.results,
  });

  factory TrailerModel.fromJson(Map<String, dynamic> json) {
    List<TrailerResultsModel>results = [];
    if(json['results'] != null){
      json['results'].forEach((element)
      {
        results.add(TrailerResultsModel.fromJson(element));
      });
    }
    return TrailerModel(
      id: json['id'],
      results: results,
    );
  }
}

class TrailerResultsModel extends TrailerResults {
  const TrailerResultsModel({
    required super.iso6391,
    required super.iso31661,
    required super.name,
    required super.key,
    required super.site,
    required super.size,
    required super.type,
    required super.official,
    required super.publishedAt,
    required super.id,
  });

  factory TrailerResultsModel.fromJson(Map<String, dynamic> json) {
    return TrailerResultsModel(
      iso6391: json['iso_639_1'],
      iso31661: json['iso_3166_1'],
      name: json['name'],
      key: json['key'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
      official: json['official'],
      publishedAt: json['published_at'],
      id: json['id'],
    );
  }
}
