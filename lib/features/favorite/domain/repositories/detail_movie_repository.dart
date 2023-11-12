import 'package:dartz/dartz.dart';
import 'package:technical_test_okta/core/errors/failures.dart';
import 'package:technical_test_okta/features/favorite/domain/entities/favorite_movie.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, bool>> submitFavorite(dynamic data);
  Future<Either<Failure, FavoriteMovie>> fetchFavoriteMovie();
}
