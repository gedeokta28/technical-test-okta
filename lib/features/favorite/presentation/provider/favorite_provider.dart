import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:technical_test_okta/core/errors/failures.dart';
import 'package:technical_test_okta/core/utils/helper.dart';
import 'package:technical_test_okta/features/favorite/data/model/favorite_body_model.dart';
import 'package:technical_test_okta/features/favorite/domain/usecases/submit_favorite.dart';
import 'package:technical_test_okta/features/favorite/presentation/provider/favorite_state.dart';

class FavoriteProvider extends ChangeNotifier {
  final SubmitFavorite submitFavorite;

  bool _favoriteStatus = false;

  bool get favoriteStatus => _favoriteStatus;

  set setFavoriteMovie(val) {
    _favoriteStatus = val;
    notifyListeners();
  }

  FavoriteProvider({
    required this.submitFavorite,
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
      yield FavoriteLoaded(favStatus: data);
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
      yield FavoriteLoaded(favStatus: data);
      dismissLoading();
    });
  }
}
