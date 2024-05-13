import 'package:dartz/dartz.dart';
import 'package:watch_it/core/error/failure.dart';
import 'package:watch_it/features/user/login/domain/entities/auth_entities.dart';

abstract class BaseAuthRepository
{
  Future<Either<Failure,AuthEntities>>getUser();
}