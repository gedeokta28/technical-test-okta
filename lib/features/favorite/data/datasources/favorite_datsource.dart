import 'dart:io';

import 'package:dio/dio.dart';
import 'package:technical_test_okta/core/utils/extension.dart';
import 'package:technical_test_okta/features/favorite/data/model/favorite_movie_model.dart';

abstract class FavoriteDataSource {
  Future<FavoriteMovieModel> fetchFavoriteMovie();
  Future<bool> submitFavorite(dynamic data);
}

class FavoriteDataSourceImplementation implements FavoriteDataSource {
  final Dio dio;
  FavoriteDataSourceImplementation({
    required this.dio,
  });

  @override
  Future<bool> submitFavorite(dynamic data) async {
    var path = 'account/gedeokta28/favorite';
    try {
      dio.withToken();
      final response = await dio.post(path, data: data);
      return response.statusCode == HttpStatus.ok;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FavoriteMovieModel> fetchFavoriteMovie() async {
    const path = 'account/gedeokta28/favorite/movies';
    try {
      dio.withToken();
      final response = await dio.get(path);
      return FavoriteMovieModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
