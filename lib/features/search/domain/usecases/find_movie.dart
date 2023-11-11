import 'package:dartz/dartz.dart';
import 'package:technical_test_okta/core/domain/entities/popular_movie.dart';
import 'package:technical_test_okta/core/errors/failures.dart';
import 'package:technical_test_okta/features/search/domain/repositories/search_repository.dart';

abstract class FindMovieUseCase<Type> {
  Future<Either<Failure, List<PopularMovieData>>> call(String textSearch);
}

class FindMovie implements FindMovieUseCase<List<PopularMovieData>> {
  final SearchRepository repository;

  FindMovie({required this.repository});

  @override
  Future<Either<Failure, List<PopularMovieData>>> call(
      String textSearch) async {
    return repository.findMovie(textSearch);
  }
}
