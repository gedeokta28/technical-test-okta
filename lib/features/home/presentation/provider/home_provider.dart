import 'package:flutter/material.dart';
import 'package:technical_test_okta/core/domain/entities/popular_movie.dart';
import 'package:technical_test_okta/core/domain/usecases/get_popular_movie.dart';
import 'package:technical_test_okta/core/errors/failures.dart';

class HomeProvider extends ChangeNotifier {
  final GetPopularMovieFromDB getPopularMovieFromDB;

  int _current = 0;
  List<PopularMovieData> _popularMovieData = [];

  int get current => _current;
  List<PopularMovieData> get popularMovieData => _popularMovieData;

  set setCurrent(val) {
    _current = val;
    notifyListeners();
  }

  set setPopularMovieData(val) {
    _popularMovieData = val;
    notifyListeners();
  }

  HomeProvider({
    required this.getPopularMovieFromDB,
  });
  Future<void> fetchPopularMovieFromDB() async {
    final popularMovie = await getPopularMovieFromDB();
    popularMovie.fold(
      (failure) async {
        return ServerFailure(failure.message);
      },
      (data) {
        setPopularMovieData = data;
      },
    );
  }
}
