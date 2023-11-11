import 'package:technical_test_okta/features/detail/domain/entities/detail_movie.dart';

class DetailMovieModel extends DetailMovieData {
  const DetailMovieModel({
    required String backdropPath,
    required String overview,
    required String title,
    required String releaseDate,
    required int id,
    required List<GenreModel> genre,
    required int voteCount,
    required int runtime,
    required double voteAverage,
  }) : super(
          backdropPath: backdropPath,
          overview: overview,
          title: title,
          releaseDate: releaseDate,
          id: id,
          genre: genre,
          voteCount: voteCount,
          runtime: runtime,
          voteAverage: voteAverage,
        );

  factory DetailMovieModel.fromJson(Map<String, dynamic> json) =>
      DetailMovieModel(
        backdropPath: json['backdrop_path'],
        genre: List<GenreModel>.from(
            json['genres'].map((x) => GenreModel.fromJson(x))),
        id: json['id'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'backdrop_path': backdropPath,
        'genres': List<dynamic>.from(genre.map((x) => x.toJson())),
        'id': id,
        'overview': overview,
        'release_date': releaseDate,
        'runtime': runtime,
        'title': title,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };

  @override
  List<Object?> get props => [
        backdropPath,
        genre,
        id,
        overview,
        releaseDate,
        runtime,
        title,
        voteAverage,
        voteCount,
      ];
}

class GenreModel extends Genre {
  const GenreModel({required int id, required String name})
      : super(
          id: id,
          name: name,
        );
  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json['id'],
        name: json['name'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
