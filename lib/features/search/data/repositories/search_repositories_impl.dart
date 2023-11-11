import 'package:dartz/dartz.dart';
import 'package:technical_test_okta/core/domain/entities/popular_movie.dart';
import 'package:technical_test_okta/core/errors/failures.dart';
import 'package:technical_test_okta/core/network/network_info.dart';
import 'package:technical_test_okta/core/utils/helper.dart';
import 'package:technical_test_okta/features/search/data/datasource/search_datasource.dart';
import 'package:technical_test_okta/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImplementation extends SearchRepository {
  final SearchDataSource dataSource;
  final NetworkInfo networkInfo;

  SearchRepositoryImplementation(
      {required this.dataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<PopularMovieData>>> findMovie(
      String textSearch) async {
    if (!await networkInfo.isConnected) {
      return const Left(ConnectionFailure(''));
    }

    try {
      final result = await dataSource.findMovie(textSearch);
      return Right(result);
    } catch (e) {
      logMe('ServerFailure');
      return const Left(ServerFailure(''));
    }
  }
}
