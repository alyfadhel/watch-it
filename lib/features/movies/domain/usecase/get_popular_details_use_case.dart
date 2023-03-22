import 'package:dartz/dartz.dart';
import 'package:watch_it/core/error/failure.dart';
import 'package:watch_it/core/usecase/base_usecase.dart';
import 'package:watch_it/features/movies/domain/entities/movies_details.dart';
import 'package:watch_it/features/movies/domain/repository/base_movies_repository.dart';

class GetPopularDetailsUseCas extends BaseUseCase<MoviesDetails,MoviesDetailsParameters>
{
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularDetailsUseCas(this.baseMoviesRepository);
  @override
  Future<Either<Failure, MoviesDetails>> call(MoviesDetailsParameters parameters)async {
    return await baseMoviesRepository.getPopularDetails(parameters);
  }


}