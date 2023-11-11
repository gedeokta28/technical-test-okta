import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:technical_test_okta/core/data/datasources/dashboard_datasource.dart';
import 'package:technical_test_okta/core/data/datasources/sqlite/local_db_helper.dart';
import 'package:technical_test_okta/core/data/models/genre_movie_model.dart';
import 'package:technical_test_okta/core/data/models/popular_movie_model.dart';
import 'package:technical_test_okta/core/network/dio_client.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  late DashboardDataSourceImplementation dataSource;
  final dio = DioClient().dio;
  final LocalDBHelper helper = LocalDBHelper();
  late DioAdapter dioAdapter;

  setUp(() {
    dioAdapter = DioAdapter(dio: dio);
    dataSource =
        DashboardDataSourceImplementation(dio: dioAdapter.dio, helper: helper);
  });

  group('popular movie', () {
    test('get popular_movie data from api', () async {
      const String path = 'movie/popular';
      final Map<String, dynamic> tResponseJson =
          json.decode(fixture('dashboard/popular_movie_response.json'));

      final tPopularMovie = PopularMovieModel.fromJson(tResponseJson);

      dioAdapter.onGet(path, (server) {
        return server.reply(
            200, fixture('dashboard/popular_movie_response.json'));
      });

      //act
      final response = await dio.get(path);

      //assert
      final result = PopularMovieModel.fromJson(json.decode(response.data));

      expect(result, tPopularMovie);
    });

    test("get popular_movie from datasource implementation", () async {
      //arrange
      final Map<String, dynamic> tResponseJson =
          jsonDecode(fixture('dashboard/popular_movie_response.json'));
      final tPopularMovie = PopularMovieModel.fromJson(tResponseJson);
      const url = 'movie/popular';

      dioAdapter.onGet(url, (server) {
        return server.reply(200, tResponseJson);
      });

      //act
      final result = await dataSource.fetchPopularMovie();

      // //assert
      expect(result, tPopularMovie);
    });
  });
  group('genre movie', () {
    test('get genre_movie data from api', () async {
      const String path = 'genre/movie/list';
      final Map<String, dynamic> tResponseJson =
          json.decode(fixture('dashboard/genre_movie_response.json'));

      final tGenreMovie = GenreMovieModel.fromJson(tResponseJson);

      dioAdapter.onGet(path, (server) {
        return server.reply(
            200, fixture('dashboard/genre_movie_response.json'));
      });

      //act
      final response = await dio.get(path);

      //assert
      final result = GenreMovieModel.fromJson(json.decode(response.data));

      expect(result, tGenreMovie);
    });

    test("get genre_movie from datasource implementation", () async {
      //arrange
      final Map<String, dynamic> tResponseJson =
          jsonDecode(fixture('dashboard/genre_movie_response.json'));
      final tGenreMovie = GenreMovieModel.fromJson(tResponseJson);
      const url = 'genre/movie/list';

      dioAdapter.onGet(url, (server) {
        return server.reply(200, tResponseJson);
      });

      //act
      final result = await dataSource.fetchGenreMovie();

      // //assert
      expect(result, tGenreMovie);
    });
  });
}
