import 'package:flutter/material.dart';
import 'package:technical_test_okta/core/domain/entities/popular_movie.dart';
import 'package:technical_test_okta/core/errors/failures.dart';
import 'package:technical_test_okta/core/utils/helper.dart';
import 'package:technical_test_okta/features/search/domain/usecases/find_movie.dart';

class SearchProvider extends ChangeNotifier {
  final FindMovie findMovie;

  SearchProvider({
    required this.findMovie,
  });

  List<PopularMovieData> _resultMovie = [];
  List<PopularMovieData> get resultMovie => _resultMovie;

  set setResultMovie(val) {
    _resultMovie = val;
    notifyListeners();
  }

  Future<void> findMovieFromDB(String textSearch) async {
    final popularMovie = await findMovie(textSearch);
    popularMovie.fold(
      (failure) async {
        return ServerFailure(failure.message);
      },
      (data) {
        logMe('resultt $data');
        setResultMovie = data;
      },
    );
  }
}
