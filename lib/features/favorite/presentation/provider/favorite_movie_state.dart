import 'package:equatable/equatable.dart';
import 'package:technical_test_okta/core/errors/failures.dart';
import 'package:technical_test_okta/features/favorite/domain/entities/favorite_movie.dart';

abstract class FavoriteMovieState extends Equatable {
  final List<FavoriteMovieData>? data;

  const FavoriteMovieState({this.data});

  @override
  List<Object?> get props => [data];
}

class FavoriteMovieInitial extends FavoriteMovieState {}

class FavoriteMovieLoading extends FavoriteMovieState {}

class FavoriteMovieLoaded extends FavoriteMovieState {
  const FavoriteMovieLoaded({List<FavoriteMovieData>? data})
      : super(data: data);

  @override
  List<Object?> get props => [data];
}

class FavoriteMovieFailed extends FavoriteMovieState {
  final Failure failure;

  const FavoriteMovieFailed({required this.failure});

  @override
  List<Object?> get props => [data, failure];
}
