import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:technical_test_okta/core/data/datasources/sqlite/local_db_helper.dart';
import 'package:technical_test_okta/core/data/models/popular_movie_model.dart';

abstract class SearchDataSource {
  Future<List<PopularMovieDataModel>> findMovie(String textSearch);
}

class SearchDataSourceImplementation implements SearchDataSource {
  final Dio dio;
  final LocalDBHelper helper;
  SearchDataSourceImplementation({required this.dio, required this.helper});

  @override
  Future<List<PopularMovieDataModel>> findMovie(String textSearch) async {
    try {
      final result = await helper.getMovieByTitle(textSearch);
      return result.map((e) => PopularMovieDataModel.fromDB(e)).toList();
    } catch (e) {
      log("getPopularMovie", error: e);
      rethrow;
    }
  }
}
