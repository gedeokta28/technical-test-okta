import 'package:dartz/dartz.dart';

import '../../errors/failures.dart';
import '../entities/genre_movie.dart';
import '../entities/popular_movie.dart';

abstract class DashboardRepository {
  Future<Either<Failure, PopularMovie>> fetchPopularMovie();
  Future<Either<Failure, GenreMovie>> fetchGenreMovie();
  Future<Either<Failure, bool>> savePopularMovie(PopularMovieData data);
  Future<Either<Failure, List<PopularMovieData>>> getPopularMovie();
}
