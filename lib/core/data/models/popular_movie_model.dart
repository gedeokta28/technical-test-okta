import 'package:technical_test_okta/core/domain/entities/popular_movie.dart';

class PopularMovieModel extends PopularMovie {
  const PopularMovieModel({
    required List<PopularMovieDataModel> data,
  }) : super(
          data: data,
        );

  factory PopularMovieModel.fromJson(Map<String, dynamic> json) =>
      PopularMovieModel(
        data: List<PopularMovieDataModel>.from(
          (json['results'].map(
            (x) => PopularMovieDataModel.fromJson(x),
          )),
        ),
      );

  @override
  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PopularMovieDataModel extends PopularMovieData {
  const PopularMovieDataModel(
      {required int id, required String posterPath, title, backdropPath})
      : super(
          id: id,
          posterPath: posterPath,
          title: title,
          backdropPath: backdropPath,
        );

  factory PopularMovieDataModel.fromJson(Map<String, dynamic> json) =>
      PopularMovieDataModel(
        id: json['id'],
        posterPath: json["poster_path"],
        title: json["title"],
        backdropPath: json["backdrop_path"],
      );
  factory PopularMovieDataModel.fromDB(Map<String, dynamic> json) =>
      PopularMovieDataModel(
        id: json['id'],
        posterPath: json["poster_path"],
        title: json["title"],
        backdropPath: json["backdrop_path"],
      );
  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'poster_path': posterPath,
        'title': title,
        'backdrop_path': backdropPath,
      };
}
