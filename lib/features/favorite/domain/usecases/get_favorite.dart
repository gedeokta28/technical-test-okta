import 'package:dartz/dartz.dart';
import 'package:technical_test_okta/core/errors/failures.dart';
import 'package:technical_test_okta/features/favorite/domain/entities/favorite_movie.dart';
import 'package:technical_test_okta/features/favorite/domain/repositories/detail_movie_repository.dart';

abstract class FavoriteMovieUseCase<Type> {
  Future<Either<Failure, FavoriteMovie>> call();
}

class GetFavoriteMovie implements FavoriteMovieUseCase<FavoriteMovie> {
  final FavoriteRepository repository;

  GetFavoriteMovie({required this.repository});

  @override
  Future<Either<Failure, FavoriteMovie>> call() async {
    return repository.fetchFavoriteMovie();
  }
}
