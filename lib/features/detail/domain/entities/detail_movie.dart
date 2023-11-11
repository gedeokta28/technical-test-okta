import 'package:equatable/equatable.dart';

class DetailMovieData extends Equatable {
  final int id;
  final String title, backdropPath, overview, releaseDate;
  final List<Genre> genre;
  final double voteAverage;
  final int voteCount, runtime;

  const DetailMovieData({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.genre,
    required this.releaseDate,
    required this.runtime,
    required this.voteCount,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        backdropPath,
        overview,
        genre,
        runtime,
        releaseDate,
        voteAverage,
        voteCount
      ];

  toJson() {}
}

class Genre extends Equatable {
  final int id;
  final String name;

  const Genre({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
  toJson() {}
}
