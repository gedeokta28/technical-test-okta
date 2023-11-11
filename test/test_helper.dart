import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mockito/annotations.dart';
import 'package:technical_test_okta/core/data/datasources/dashboard_datasource.dart';
import 'package:technical_test_okta/core/domain/repositories/dashboard_repository.dart';
import 'package:technical_test_okta/core/domain/usecases/get_genre_movie.dart';
import 'package:technical_test_okta/core/domain/usecases/get_popular_movie.dart';
import 'package:technical_test_okta/core/network/network_info.dart';

@GenerateMocks([
  Connectivity,
  NetworkInfo,
  DashboardDataSource,
  DashboardRepository,
  GetPopularMovie,
  GetGenreMovie
])
void main() {}
