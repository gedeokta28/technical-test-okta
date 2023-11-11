import 'package:dartz/dartz.dart';
import 'package:technical_test_okta/core/errors/failures.dart';
import 'package:technical_test_okta/features/detail/domain/entities/detail_movie.dart';

abstract class DetailMovieRepository {
  Future<Either<Failure, DetailMovieData>> fetchDetailMovie(int id);
}
