import 'package:dartz/dartz.dart';
import 'package:watch_it/core/error/failure.dart';
import 'package:watch_it/core/usecase/base_usecase.dart';
import 'package:watch_it/features/movies/domain/entities/movies.dart';
import 'package:watch_it/features/movies/domain/repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<MoviesResults>,PageParameters>
{
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<MoviesResults>>> call(PageParameters parameters)async {
    return await baseMoviesRepository.getTopRatedMovies(parameters);
  }

}