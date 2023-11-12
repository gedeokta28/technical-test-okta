import 'package:dartz/dartz.dart';
import 'package:technical_test_okta/core/errors/failures.dart';
import 'package:technical_test_okta/core/network/network_info.dart';
import 'package:technical_test_okta/features/favorite/data/datasources/favorite_datsource.dart';
import 'package:technical_test_okta/features/favorite/domain/repositories/detail_movie_repository.dart';

class FavoriteRepositoryImplementation extends FavoriteRepository {
  final FavoriteDataSource dataSource;
  final NetworkInfo networkInfo;

  FavoriteRepositoryImplementation(
      {required this.dataSource, required this.networkInfo});

  @override
  Future<Either<Failure, bool>> submitFavorite(dynamic data) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await dataSource.submitFavorite(data);
        return Right(result);
      } catch (e) {
        return const Left(ServerFailure(''));
      }
    }
    return const Left(ConnectionFailure(''));
  }
}
