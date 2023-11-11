import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:technical_test_okta/core/errors/failures.dart';
import 'package:technical_test_okta/features/detail/domain/entities/detail_movie.dart';
import 'package:technical_test_okta/features/detail/domain/usecases/get_detail_movie.dart';
import 'package:technical_test_okta/features/detail/presentation/provider/detail_movie_state.dart';

class DetailMovieProvider extends ChangeNotifier {
  final GetDetailMovie getDetailMovie;

  late DetailMovieData _detailMovieData;
  DetailMovieState _detailMovieState = DetailMovieInitial();

  DetailMovieState get detailMovieState => _detailMovieState;
  DetailMovieData get detailMovieData => _detailMovieData;

  set setDetailMovieData(val) {
    _detailMovieData = val;
    notifyListeners();
  }

  set setStateDetailMovie(val) {
    _detailMovieState = val;
    notifyListeners();
  }

  DetailMovieProvider({
    required this.getDetailMovie,
  });

  Future<void> fetchGenreMovie(int id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    setStateDetailMovie = DetailMovieLoading();
    late Either<Failure, DetailMovieData> result;
    result = await getDetailMovie(id);
    await Future.delayed(const Duration(milliseconds: 500));
    result.fold(
      (failure) {
        setStateDetailMovie = DetailMovieFailed(failure: failure);
      },
      (data) {
        setDetailMovieData = data;
        setStateDetailMovie = const DetailMovieLoaded();
      },
    );
  }
}
