import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:technical_test_okta/core/data/datasources/dashboard_datasource.dart';
import 'package:technical_test_okta/core/data/datasources/sqlite/local_db_helper.dart';
import 'package:technical_test_okta/core/data/repositories/dashboard_repository_impl.dart';
import 'package:technical_test_okta/core/domain/repositories/dashboard_repository.dart';
import 'package:technical_test_okta/core/domain/usecases/get_genre_movie.dart';
import 'package:technical_test_okta/core/domain/usecases/get_popular_movie.dart';
import 'package:technical_test_okta/core/domain/usecases/save_popular_movie.dart';
import 'package:technical_test_okta/core/network/dio_client.dart';
import 'package:technical_test_okta/core/network/network_info.dart';
import 'package:technical_test_okta/core/presentation/provider/dashboard_provider.dart';
import 'package:technical_test_okta/features/detail/data/datasources/detail_movie_datasource.dart';
import 'package:technical_test_okta/features/detail/data/repositories/detail_movie_repository_impl.dart';
import 'package:technical_test_okta/features/detail/domain/repositories/detail_movie_repository.dart';
import 'package:technical_test_okta/features/detail/domain/usecases/get_detail_movie.dart';
import 'package:technical_test_okta/features/detail/presentation/provider/detail_movie_provider.dart';
import 'package:technical_test_okta/features/search/data/datasource/search_datasource.dart';
import 'package:technical_test_okta/features/search/data/repositories/search_repositories_impl.dart';
import 'package:technical_test_okta/features/search/domain/repositories/search_repository.dart';
import 'package:technical_test_okta/features/search/domain/usecases/find_movie.dart';
import 'package:technical_test_okta/features/search/presentation/provider/search_provider.dart';

import '../../features/home/presentation/provider/home_provider.dart';

final locator = GetIt.instance;

Future<void> locatorInit() async {
  //external
  locator.registerLazySingleton<GlobalKey<NavigatorState>>(
      () => GlobalKey<NavigatorState>());
  locator.registerFactory<Dio>(() => DioClient().dio);
  locator.registerLazySingleton<LocalDBHelper>(() => LocalDBHelper());
  locator.registerLazySingleton<Connectivity>(() => Connectivity());

  //network info
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementation(locator()));

  //provider
  locator.registerFactory<DashboardProvider>(() => DashboardProvider(
      getPopularMovie: locator(),
      savePopularMovie: locator(),
      getPopularMovieFromDB: locator()));
  locator.registerFactory<HomeProvider>(() =>
      HomeProvider(getPopularMovieFromDB: locator(), getGenreMovie: locator()));
  locator.registerFactory<SearchProvider>(() => SearchProvider(
        findMovie: locator(),
      ));
  locator.registerFactory<DetailMovieProvider>(() => DetailMovieProvider(
        getDetailMovie: locator(),
      ));

  //data source
  locator.registerLazySingleton<DashboardDataSource>(() =>
      DashboardDataSourceImplementation(
          dio: locator<Dio>(), helper: locator<LocalDBHelper>()));
  locator.registerLazySingleton<SearchDataSource>(() =>
      SearchDataSourceImplementation(
          dio: locator<Dio>(), helper: locator<LocalDBHelper>()));
  locator.registerLazySingleton<DetailMovieDataSource>(
      () => DetailMovieDataSourceImplementation(
            dio: locator<Dio>(),
          ));

  //repository
  locator.registerLazySingleton<DashboardRepository>(() =>
      DashboardRepositoryImplementation(
          dataSource: locator(), networkInfo: locator()));
  locator.registerLazySingleton<SearchRepository>(() =>
      SearchRepositoryImplementation(
          dataSource: locator(), networkInfo: locator()));
  locator.registerLazySingleton<DetailMovieRepository>(() =>
      DetailMovieRepositoryImplementation(
          dataSource: locator(), networkInfo: locator()));

  //usecase
  locator.registerLazySingleton<GetGenreMovie>(
      () => GetGenreMovie(repository: locator()));
  locator.registerLazySingleton<GetPopularMovie>(
      () => GetPopularMovie(repository: locator()));
  locator.registerLazySingleton<SavePopularMovie>(
      () => SavePopularMovie(repository: locator()));
  locator.registerLazySingleton<GetPopularMovieFromDB>(
      () => GetPopularMovieFromDB(repository: locator()));
  locator
      .registerLazySingleton<FindMovie>(() => FindMovie(repository: locator()));
  locator.registerLazySingleton<GetDetailMovie>(
      () => GetDetailMovie(repository: locator()));
}
