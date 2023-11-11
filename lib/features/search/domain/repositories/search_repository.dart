import 'package:dartz/dartz.dart';
import 'package:technical_test_okta/core/domain/entities/popular_movie.dart';
import 'package:technical_test_okta/core/errors/failures.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<PopularMovieData>>> findMovie(String textSearch);
}
