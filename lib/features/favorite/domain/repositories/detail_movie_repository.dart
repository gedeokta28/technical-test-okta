import 'package:dartz/dartz.dart';
import 'package:technical_test_okta/core/errors/failures.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, bool>> submitFavorite(dynamic data);
}
