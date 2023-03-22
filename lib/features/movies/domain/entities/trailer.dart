import 'package:equatable/equatable.dart';

class Trailer extends Equatable {
  final int id;
  final List<TrailerResults> results;

  const Trailer({
    required this.id,
    required this.results,
  });

  @override
  List<Object?> get props => [
    id,
    results,
  ];
}

class TrailerResults extends Equatable
{
  final String iso6391;
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String publishedAt;
  final String id;

  const TrailerResults({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  @override
  List<Object?> get props => [
    iso6391,
    iso31661,
    name,
    key,
    site,
    size,
    type,
    official,
    publishedAt,
    id,
  ];

}
