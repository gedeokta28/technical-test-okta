import 'package:equatable/equatable.dart';

class FavoriteMovie extends Equatable {
  final List<FavoriteMovieData> data;

  const FavoriteMovie({
    required this.data,
  });

  @override
  List<Object?> get props => [data];

  toJson() {}
}

class FavoriteMovieData extends Equatable {
  final int id;
  final String posterPath, title, backdropPath;

  const FavoriteMovieData({
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
