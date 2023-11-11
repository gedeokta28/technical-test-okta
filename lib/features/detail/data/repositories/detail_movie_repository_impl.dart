import 'package:dartz/dartz.dart';
import 'package:technical_test_okta/core/errors/failures.dart';
import 'package:technical_test_okta/core/network/network_info.dart';
import 'package:technical_test_okta/features/detail/data/datasources/detail_movie_datasource.dart';
import 'package:technical_test_okta/features/detail/domain/entities/detail_movie.dart';
import 'package:technical_test_okta/features/detail/domain/repositories/detail_movie_repository.dart';

class DetailMovieRepositoryImplementation extends DetailMovieRepository {
  final DetailMovieDataSource dataSource;
  final NetworkInfo networkInfo;

  DetailMovieRepositoryImplementation(
      {required this.dataSource, required this.networkInfo});

  @override
  Future<Either<Failure, DetailMovieData>> fetchDetailMovie(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await dataSource.fetchDetailMovie(id);
        return Right(result);
      } catch (e) {
        return const Left(ServerFailure(''));
      }
    }
    return const Left(ConnectionFailure(''));
  }
}
