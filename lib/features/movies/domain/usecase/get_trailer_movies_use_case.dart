import 'package:dartz/dartz.dart';
import 'package:watch_it/core/error/failure.dart';
import 'package:watch_it/core/usecase/base_usecase.dart';
import 'package:watch_it/features/movies/domain/entities/trailer.dart';
import 'package:watch_it/features/movies/domain/repository/base_movies_repository.dart';

class GetTrailerMoviesUseCase extends BaseUseCase<List<TrailerResults>,MoviesDetailsParameters>
{
  final BaseMoviesRepository baseMoviesRepository;

  GetTrailerMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<TrailerResults>>> call(MoviesDetailsParameters parameters)async {
    return await baseMoviesRepository.getTrailerMovies(parameters);
  }

}