import 'package:technical_test_okta/features/favorite/domain/entities/favorite_movie.dart';

class FavoriteMovieModel extends FavoriteMovie {
  const FavoriteMovieModel({
    required List<FavoriteMovieDataModel> data,
  }) : super(
          data: data,
        );

  factory FavoriteMovieModel.fromJson(Map<String, dynamic> json) =>
      FavoriteMovieModel(
        data: List<FavoriteMovieDataModel>.from(
          (json['results'].map(
            (x) => FavoriteMovieDataModel.fromJson(x),
          )),
        ),
      );

  @override
  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FavoriteMovieDataModel extends FavoriteMovieData {
  const FavoriteMovieDataModel(
      {required int id, required String posterPath, title, backdropPath})
      : super(
          id: id,
          posterPath: posterPath,
          title: title,
          backdropPath: backdropPath,
        );

  factory FavoriteMovieDataModel.fromJson(Map<String, dynamic> json) =>
      FavoriteMovieDataModel(
        id: json['id'],
        posterPath: json["poster_path"],
        title: json["title"],
        backdropPath: json["backdrop_path"],
      );
  factory FavoriteMovieDataModel.fromDB(Map<String, dynamic> json) =>
      FavoriteMovieDataModel(
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
