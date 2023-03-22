import 'package:dartz/dartz.dart';
import 'package:watch_it/core/error/failure.dart';
import 'package:watch_it/core/usecase/base_usecase.dart';
import 'package:watch_it/features/movies/domain/entities/movies.dart';
import 'package:watch_it/features/movies/domain/repository/base_movies_repository.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<MoviesResults>,NoParameters>
{
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<MoviesResults>>> call(NoParameters parameters)async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }

}