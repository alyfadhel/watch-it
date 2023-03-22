import 'package:equatable/equatable.dart';

class GetCredit extends Equatable {
  final int id;
  final List<Cast> cast;
  final List<Crew> crew;

  const GetCredit({
    required this.id,
    required this.cast,
    required this.crew,
  });

  @override
  List<Object?> get props => [
        id,
        cast,
        crew,
      ];
}

class Cast extends Equatable {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  const Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  @override
  List<Object?> get props => [
        adult,
        gender,
        id,
        knownForDepartment,
        name,
        originalName,
        popularity,
        profilePath,
        castId,
        character,
        creditId,
        order,
      ];
}

class Crew extends Equatable {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final String creditId;
  final String department;
  final String job;

  const Crew({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.creditId,
    required this.department,
    required this.job,
  });

  @override
  List<Object?> get props => [
    adult,
    gender,
    id,
    knownForDepartment,
    name,
    originalName,
    popularity,
    profilePath,
    creditId,
    department,
    job,
  ];
}
