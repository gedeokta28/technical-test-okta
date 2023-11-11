import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:technical_test_okta/core/domain/entities/genre_movie.dart';
import 'package:technical_test_okta/core/domain/entities/popular_movie.dart';
import 'package:technical_test_okta/core/domain/usecases/get_genre_movie.dart';
import 'package:technical_test_okta/core/domain/usecases/get_popular_movie.dart';
import 'package:technical_test_okta/core/errors/failures.dart';
import 'package:technical_test_okta/features/home/presentation/provider/genre_movie_state.dart';

class HomeProvider extends ChangeNotifier {
  final GetPopularMovieFromDB getPopularMovieFromDB;
  final GetGenreMovie getGenreMovie;

  int _current = 0;
  List<PopularMovieData> _popularMovieData = [];
  List<PopularMovieData> _popularMovieDataShuffle = [];
  GenreMovieState _stateGenreMovie = GenreMovieInitial();
  List<GenreMovieData> _genreMovieData = [];

  int get current => _current;
  List<PopularMovieData> get popularMovieData => _popularMovieData;
  List<PopularMovieData> get popularMovieDataShuffle =>
      _popularMovieDataShuffle;
  GenreMovieState get stateGenreMovie => _stateGenreMovie;
  List<GenreMovieData> get genreMovieData => _genreMovieData;

  set setCurrent(val) {
    _current = val;
    notifyListeners();
  }

  set setPopularMovieData(val) {
    _popularMovieData = val;
    notifyListeners();
  }

  set setGenreMovieData(val) {
    _genreMovieData = val;
    notifyListeners();
  }

  set setStateGenreMovie(val) {
    _stateGenreMovie = val;
    notifyListeners();
  }

  HomeProvider({
    required this.getPopularMovieFromDB,
    required this.getGenreMovie,
  });

  Future<void> fetchPopularMovieFromDB() async {
    final popularMovie = await getPopularMovieFromDB();
    popularMovie.fold(
      (failure) async {
        return ServerFailure(failure.message);
      },
      (data) {
        shuffle(data);
        setPopularMovieData = data;
      },
    );
  }

  Future<void> fetchGenreMovie() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setStateGenreMovie = GenreMovieLoading();
    late Either<Failure, GenreMovie> result;
    result = await getGenreMovie();
    await Future.delayed(const Duration(milliseconds: 500));
    result.fold(
      (failure) {
        setStateGenreMovie = GenreMovieFailed(failure: failure);
      },
      (data) {
        setGenreMovieData = data.data;
        setStateGenreMovie = const GenreMovieLoaded();
      },
    );
  }

  List<PopularMovieData> shuffle(List<PopularMovieData> items) {
    var random = Random();

    for (var i = items.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }
    items.length -= 15;
    _popularMovieDataShuffle = items;
    return items;
  }
}
