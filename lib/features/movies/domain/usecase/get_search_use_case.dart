import 'package:dartz/dartz.dart';
import 'package:watch_it/core/error/failure.dart';
import 'package:watch_it/core/usecase/base_usecase.dart';
import 'package:watch_it/features/movies/domain/entities/search.dart';
import 'package:watch_it/features/movies/domain/repository/base_movies_repository.dart';

class GetSearchUseCase extends BaseUseCase<List<SearchResults>,SearchParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetSearchUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<SearchResults>>> call(SearchParameters parameters)async {
    return await baseMoviesRepository.getSearch(parameters);
  }
}