import 'package:technical_test_okta/core/domain/entities/genre_movie.dart';

class GenreMovieModel extends GenreMovie {
  const GenreMovieModel({
    required List<GenreMovieDataModel> data,
  }) : super(
          data: data,
        );

  factory GenreMovieModel.fromJson(Map<String, dynamic> json) =>
      GenreMovieModel(
        data: List<GenreMovieDataModel>.from(
          (json['genres'].map(
            (x) => GenreMovieDataModel.fromJson(x),
          )),
        ),
      );

  @override
  Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GenreMovieDataModel extends GenreMovieData {
  const GenreMovieDataModel({
    required int id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory GenreMovieDataModel.fromJson(Map<String, dynamic> json) =>
      GenreMovieDataModel(
        id: json['id'],
        name: json["name"],
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
