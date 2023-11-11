import 'package:dartz/dartz.dart';
import 'package:technical_test_okta/core/domain/entities/popular_movie.dart';
import 'package:technical_test_okta/core/domain/repositories/dashboard_repository.dart';

import '../../../../core/errors/failures.dart';
import 'dashboard_usecase.dart';

class GetPopularMovie implements PopularMovieUseCase<PopularMovie> {
  final DashboardRepository repository;

  GetPopularMovie({required this.repository});

  @override
  Future<Either<Failure, PopularMovie>> call() async {
    return repository.fetchPopularMovie();
  }
}

class GetPopularMovieFromDB
    implements PopularMovieFromDBUseCase<List<PopularMovieData>> {
  final DashboardRepository repository;

  GetPopularMovieFromDB({required this.repository});

  @override
  Future<Either<Failure, List<PopularMovieData>>> call() async {
    return repository.getPopularMovie();
  }
}
