import 'package:dartz/dartz.dart';

import '../../errors/failures.dart';
import '../entities/genre_movie.dart';
import '../entities/popular_movie.dart';

abstract class PopularMovieUseCase<Type> {
  Future<Either<Failure, PopularMovie>> call();
}

abstract class GenreMovieUseCase<Type> {
  Future<Either<Failure, GenreMovie>> call();
}

abstract class SavePopularMovieUseCase<Type> {
  Future<Either<Failure, bool>> call(PopularMovieData data);
}

abstract class PopularMovieFromDBUseCase<Type> {
  Future<Either<Failure, List<PopularMovieData>>> call();
}
