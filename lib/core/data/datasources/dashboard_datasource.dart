import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:technical_test_okta/core/data/datasources/sqlite/dashboard_db_helper.dart';
import 'package:technical_test_okta/core/data/models/genre_movie_model.dart';
import 'package:technical_test_okta/core/data/models/popular_movie_model.dart';
import 'package:technical_test_okta/core/domain/entities/popular_movie.dart';
import 'package:technical_test_okta/core/utils/extension.dart';

abstract class DashboardDataSource {
  Future<PopularMovieModel> fetchPopularMovie();
  Future<GenreMovieModel> fetchGenreMovie();
  Future<bool> savePopularMovie(PopularMovieData data);
  Future<List<PopularMovieDataModel>> getPopularMovie();
}

class DashboardDataSourceImplementation implements DashboardDataSource {
  final Dio dio;
  final DashboardDBHelper helper;
  DashboardDataSourceImplementation({required this.dio, required this.helper});

  @override
  Future<PopularMovieModel> fetchPopularMovie() async {
    const path = 'movie/popular';
    try {
      dio.withToken();
      final response = await dio.get(path);
      return PopularMovieModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GenreMovieModel> fetchGenreMovie() async {
    const path = 'genre/movie/list';
    try {
      dio.withToken();
      final response = await dio.get(path);
      return GenreMovieModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> savePopularMovie(PopularMovieData data) async {
    try {
      await helper.insertPopularMovie(data);
      return true;
    } catch (e) {
      log("savePopularMovie", error: e);
      return false;
    }
  }

  @override
  Future<List<PopularMovieDataModel>> getPopularMovie() async {
    try {
      final result = await helper.getPopularMovie();
      return result.map((e) => PopularMovieDataModel.fromDB(e)).toList();
    } catch (e) {
      log("getAddresses", error: e);
      rethrow;
    }
  }
}
