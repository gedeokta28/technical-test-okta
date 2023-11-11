import 'package:dartz/dartz.dart';
import 'package:technical_test_okta/core/data/datasources/dashboard_datasource.dart';
import 'package:technical_test_okta/core/utils/helper.dart';

import '../../domain/entities/popular_movie.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../../errors/failures.dart';
import '../../network/network_info.dart';
import '../models/genre_movie_model.dart';

class DashboardRepositoryImplementation extends DashboardRepository {
  final DashboardDataSource dataSource;
  final NetworkInfo networkInfo;

  DashboardRepositoryImplementation(
      {required this.dataSource, required this.networkInfo});

  @override
  Future<Either<Failure, PopularMovie>> fetchPopularMovie() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await dataSource.fetchPopularMovie();
        return Right(result);
      } catch (e) {
        return const Left(ServerFailure(''));
      }
    }
    return const Left(ConnectionFailure(''));
  }

  @override
  Future<Either<Failure, GenreMovieModel>> fetchGenreMovie() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await dataSource.fetchGenreMovie();
        return Right(result);
      } catch (e) {
        return const Left(ServerFailure(''));
      }
    }
    return const Left(ConnectionFailure(''));
  }

  @override
  Future<Either<Failure, bool>> savePopularMovie(PopularMovieData data) async {
    if (!await networkInfo.isConnected) {
      return const Left(ServerFailure(''));
    }

    try {
      final result = await dataSource.savePopularMovie(data);
      return Right(result);
    } catch (e) {
      return const Left(ConnectionFailure(''));
    }
  }

  @override
  Future<Either<Failure, List<PopularMovieData>>> getPopularMovie() async {
    if (!await networkInfo.isConnected) {
      return const Left(ConnectionFailure(''));
    }

    try {
      final result = await dataSource.getPopularMovie();
      return Right(result);
    } catch (e) {
      logMe('ServerFailure');

      return const Left(ServerFailure(''));
    }
  }
}
