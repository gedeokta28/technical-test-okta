import 'package:equatable/equatable.dart';
import 'package:technical_test_okta/core/domain/entities/genre_movie.dart';
import 'package:technical_test_okta/core/errors/failures.dart';

abstract class GenreMovieState extends Equatable {
  final List<GenreMovieData>? data;

  const GenreMovieState({this.data});

  @override
  List<Object?> get props => [data];
}

class GenreMovieInitial extends GenreMovieState {}

class GenreMovieLoading extends GenreMovieState {}

class GenreMovieLoaded extends GenreMovieState {
  const GenreMovieLoaded({List<GenreMovieData>? data}) : super(data: data);

  @override
  List<Object?> get props => [data];
}

class GenreMovieFailed extends GenreMovieState {
  final Failure failure;

  const GenreMovieFailed({required this.failure});

  @override
  List<Object?> get props => [data, failure];
}
