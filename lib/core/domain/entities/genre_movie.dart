import 'package:equatable/equatable.dart';

class GenreMovie extends Equatable {
  final List<GenreMovieData> data;

  const GenreMovie({
    required this.data,
  });

  @override
  List<Object?> get props => [data];

  toJson() {}
}

class GenreMovieData extends Equatable {
  final int id;
  final String name;

  const GenreMovieData({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  toJson() {}
}
