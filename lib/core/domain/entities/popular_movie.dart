import 'package:equatable/equatable.dart';

class PopularMovie extends Equatable {
  final List<PopularMovieData> data;

  const PopularMovie({
    required this.data,
  });

  @override
  List<Object?> get props => [data];

  toJson() {}
}

class PopularMovieData extends Equatable {
  final int id;
  final String posterPath, title, backdropPath;

  const PopularMovieData({
    required this.id,
    required this.posterPath,
    required this.title,
    required this.backdropPath,
  });

  @override
  List<Object?> get props => [
        id,
        posterPath,
        title,
        backdropPath,
      ];

  toJson() {}
}
