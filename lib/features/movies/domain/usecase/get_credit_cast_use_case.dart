import 'package:dartz/dartz.dart';
import 'package:watch_it/core/error/failure.dart';
import 'package:watch_it/core/usecase/base_usecase.dart';
import 'package:watch_it/features/movies/domain/entities/get_credit.dart';
import 'package:watch_it/features/movies/domain/repository/base_movies_repository.dart';

class GetCreditCastUseCase extends BaseUseCase<GetCredit,MoviesDetailsParameters>
{
  final BaseMoviesRepository baseMoviesRepository;

  GetCreditCastUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, GetCredit>> call(MoviesDetailsParameters parameters)async {
    return await baseMoviesRepository.getCreditCast(parameters);
  }

}
