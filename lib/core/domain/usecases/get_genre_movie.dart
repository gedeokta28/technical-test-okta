import 'package:dartz/dartz.dart';
import 'package:technical_test_okta/core/domain/repositories/dashboard_repository.dart';

import '../../../../core/errors/failures.dart';
import '../entities/genre_movie.dart';
import 'dashboard_usecase.dart';

class GetGenreMovie implements GenreMovieUseCase<GenreMovie> {
  final DashboardRepository repository;

  GetGenreMovie({required this.repository});

  @override
  Future<Either<Failure, GenreMovie>> call() async {
    return repository.fetchGenreMovie();
  }
}
