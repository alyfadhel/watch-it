import 'package:watch_it/features/movies/domain/entities/get_credit.dart';

class GetCreditModel extends GetCredit {
  const GetCreditModel({
    required super.id,
    required super.cast,
    required super.crew,
  });

  factory GetCreditModel.fromJson(Map<String, dynamic> json) {
    List<CastModel>cast = [];
    if(json['cast'] != null){
      json['cast'].forEach((element)
      {
        cast.add(CastModel.fromJson(element));
      });
    }

    List<CrewModel>crew = [];
    if(json['crew'] != null){
      json['crew'].forEach((element)
      {
        crew.add(CrewModel.fromJson(element));
      });
    }

    return GetCreditModel(
      id: json['id'],
      cast: cast,
      crew: crew,
    );
  }
}

class CastModel extends Cast {
  const CastModel({
    required super.adult,
    required super.gender,
    required super.id,
    required super.knownForDepartment,
    required super.name,
    required super.originalName,
    required super.popularity,
    required super.profilePath,
    required super.castId,
    required super.character,
    required super.creditId,
    required super.order,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'],
      castId: json['cast_id'],
      character: json['character'],
      creditId: json['credit_id'],
      order: json['order'],
    );
  }
}

class CrewModel extends Crew {
  const CrewModel({
    required super.adult,
    required super.gender,
    required super.id,
    required super.knownForDepartment,
    required super.name,
    required super.originalName,
    required super.popularity,
    required super.profilePath,
    required super.creditId,
    required super.department,
    required super.job,
  });

  factory CrewModel.fromJson(Map<String, dynamic> json) {
    return CrewModel(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'],
      creditId: json['credit_id'],
      department: json['department'],
      job: json['job'],
    );
  }
}
