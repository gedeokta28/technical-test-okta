import 'package:dio/dio.dart';
import 'package:technical_test_okta/core/utils/extension.dart';
import 'package:technical_test_okta/features/detail/data/model/detail_movie_model.dart';

abstract class DetailMovieDataSource {
  Future<DetailMovieModel> fetchDetailMovie(int id);
}

class DetailMovieDataSourceImplementation implements DetailMovieDataSource {
  final Dio dio;
  DetailMovieDataSourceImplementation({
    required this.dio,
  });

  @override
  Future<DetailMovieModel> fetchDetailMovie(int id) async {
    var path = 'movie/$id';
    try {
      dio.withToken();
      final response = await dio.get(path);
      return DetailMovieModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
