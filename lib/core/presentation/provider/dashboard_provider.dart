import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:technical_test_okta/core/domain/entities/popular_movie.dart';
import 'package:technical_test_okta/core/domain/usecases/get_popular_movie.dart';
import 'package:technical_test_okta/core/domain/usecases/save_popular_movie.dart';
import 'package:technical_test_okta/core/errors/failures.dart';
import 'package:technical_test_okta/core/presentation/provider/popular_movie_state.dart';
import 'package:technical_test_okta/core/utils/helper.dart';

class DashboardProvider extends ChangeNotifier {
  // initial
  final GetPopularMovie getPopularMovie;
  final SavePopularMovie savePopularMovie;
  final GetPopularMovieFromDB getPopularMovieFromDB;

  PopularMovieState _statePopularMovie = PopularMovieInitial();
  List<PopularMovieData> _popularMovieData = [];

  // constructor
  DashboardProvider({
    required this.getPopularMovie,
    required this.savePopularMovie,
    required this.getPopularMovieFromDB,
  });

  //setter
  set setPopularMovieData(val) {
    _popularMovieData = val;
    notifyListeners();
  }

  set setStatePopularMovie(val) {
    _statePopularMovie = val;
    notifyListeners();
  }

  // getter
  PopularMovieState get state => _statePopularMovie;
  List<PopularMovieData> get popularMovieData => _popularMovieData;

  // method
  Future<void> fetchDataPopularMovie() async {
    await fetchPopularMovieFromDB();
    if (_popularMovieData.isEmpty) {
      showLoading();
      await Future.delayed(const Duration(milliseconds: 500));
      setStatePopularMovie = PopularMovieLoading();
      late Either<Failure, PopularMovie> result;
      result = await getPopularMovie();
      await Future.delayed(const Duration(milliseconds: 500));
      result.fold(
        (failure) {
          dismissLoading();
          setStatePopularMovie = PopularMovieFailed(failure: failure);
        },
        (data) {
          setStatePopularMovie = const PopularMovieLoaded();
          setPopularMovieData = data.data;
          for (var data in _popularMovieData) {
            addPopularMovie(data);
          }
          dismissLoading();
        },
      );
    }
  }

  Future<bool> addPopularMovie(PopularMovieData popularMovieData) async {
    final popularMovie = await savePopularMovie(popularMovieData);
    return popularMovie.fold(
      (failure) async {
        return false;
      },
      (data) async {
        return true;
      },
    );
  }

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
