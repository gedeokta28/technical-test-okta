import 'package:dartz/dartz.dart';
import 'package:technical_test_okta/core/errors/failures.dart';
import 'package:technical_test_okta/features/detail/domain/entities/detail_movie.dart';
import 'package:technical_test_okta/features/detail/domain/repositories/detail_movie_repository.dart';

abstract class GetDetailMovieUseCase<Type> {
  Future<Either<Failure, DetailMovieData>> call(int id);
}

class GetDetailMovie implements GetDetailMovieUseCase<DetailMovieData> {
  final DetailMovieRepository repository;

  GetDetailMovie({required this.repository});

  @override
  Future<Either<Failure, DetailMovieData>> call(int id) async {
    return repository.fetchDetailMovie(id);
  }
}
