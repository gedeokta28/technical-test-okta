import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:technical_test_okta/core/errors/failures.dart';
import 'package:technical_test_okta/core/utils/helper.dart';
import 'package:technical_test_okta/features/favorite/data/model/favorite_body_model.dart';
import 'package:technical_test_okta/features/favorite/domain/entities/favorite_movie.dart';
import 'package:technical_test_okta/features/favorite/domain/usecases/get_favorite.dart';
import 'package:technical_test_okta/features/favorite/domain/usecases/submit_favorite.dart';
import 'package:technical_test_okta/features/favorite/presentation/provider/favorite_movie_state.dart';
import 'package:technical_test_okta/features/favorite/presentation/provider/favorite_state.dart';

class FavoriteProvider extends ChangeNotifier {
  final SubmitFavorite submitFavorite;
  final GetFavoriteMovie getFavoriteMovie;

  bool _favoriteStatus = false;
  FavoriteMovieState _favoriteMovieState = FavoriteMovieInitial();
  List<FavoriteMovieData> _favoriteMovieData = [];

  bool get favoriteStatus => _favoriteStatus;
  FavoriteMovieState get state => _favoriteMovieState;
  List<FavoriteMovieData> get favoriteMovieData => _favoriteMovieData;

  set setFavoriteMovie(val) {
    _favoriteStatus = val;
    notifyListeners();
  }

  set setFavoriteMovieData(val) {
    _favoriteMovieData = val;
    notifyListeners();
  }

  set setStateFavoriteMovie(val) {
    _favoriteMovieState = val;
    notifyListeners();
  }

  FavoriteProvider({
    required this.submitFavorite,
    required this.getFavoriteMovie,
  });

  Stream<FavoriteState> addToFav(int id) async* {
    showLoading('Processing');
    yield FavoriteLoading();
    FavoriteBody favoriteBody;
    favoriteBody = FavoriteBody(
      mediaId: id,
      mediaType: "movie",
      favorite: true,
    );
    late Either<Failure, bool> result;
    result = await submitFavorite.execute(favoriteBody.toMap());
    yield* result.fold((failure) async* {
      dismissLoading();
      yield FavoriteFailure(failure: failure);
    }, (data) async* {
      yield FavoriteChanged(favStatus: data);
      dismissLoading();
    });
  }

  Stream<FavoriteState> removeToFav(int id) async* {
    showLoading('Processing');
    yield FavoriteLoading();
    FavoriteBody favoriteBody;
    favoriteBody = FavoriteBody(
      mediaId: id,
      mediaType: "movie",
      favorite: false,
    );
    late Either<Failure, bool> result;
    result = await submitFavorite.execute(favoriteBody.toMap());
    yield* result.fold((failure) async* {
      dismissLoading();
      yield FavoriteFailure(failure: failure);
    }, (data) async* {
      yield FavoriteChanged(favStatus: data);
      dismissLoading();
    });
  }

  Future<void> fetchDataFavoriteMovie() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setStateFavoriteMovie = FavoriteMovieLoading();
    late Either<Failure, FavoriteMovie> result;
    result = await getFavoriteMovie();
    await Future.delayed(const Duration(milliseconds: 500));
    result.fold(
      (failure) {
        setStateFavoriteMovie = FavoriteMovieFailed(failure: failure);
      },
      (data) {
        setStateFavoriteMovie = const FavoriteMovieLoaded();
        setFavoriteMovieData = data.data;
      },
    );
  }
}
