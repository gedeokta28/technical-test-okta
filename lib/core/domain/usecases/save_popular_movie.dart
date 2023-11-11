import 'package:dartz/dartz.dart';
import 'package:technical_test_okta/core/domain/entities/popular_movie.dart';
import 'package:technical_test_okta/core/domain/repositories/dashboard_repository.dart';

import '../../../../core/errors/failures.dart';
import 'dashboard_usecase.dart';

class SavePopularMovie implements SavePopularMovieUseCase<PopularMovie> {
  final DashboardRepository repository;

  SavePopularMovie({required this.repository});

  @override
  Future<Either<Failure, bool>> call(PopularMovieData data) async {
    return repository.savePopularMovie(data);
  }
}
