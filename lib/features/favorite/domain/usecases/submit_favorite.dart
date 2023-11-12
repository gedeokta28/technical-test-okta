import 'package:dartz/dartz.dart';
import 'package:technical_test_okta/core/errors/failures.dart';
import 'package:technical_test_okta/features/favorite/domain/repositories/detail_movie_repository.dart';

abstract class SubmitFavoriteUseCase<Type> {
  Future<Either<Failure, bool>> execute(dynamic data);
}

class SubmitFavorite implements SubmitFavoriteUseCase<bool> {
  final FavoriteRepository repository;

  SubmitFavorite({required this.repository});

  @override
  Future<Either<Failure, bool>> execute(dynamic data) async {
    return repository.submitFavorite(data);
  }
}
