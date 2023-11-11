import 'package:equatable/equatable.dart';
import 'package:technical_test_okta/core/domain/entities/popular_movie.dart';
import 'package:technical_test_okta/core/errors/failures.dart';

abstract class PopularMovieState extends Equatable {
  final List<PopularMovieData>? data;

  const PopularMovieState({this.data});

  @override
  List<Object?> get props => [data];
}

class PopularMovieInitial extends PopularMovieState {}

class PopularMovieLoading extends PopularMovieState {}

class PopularMovieLoaded extends PopularMovieState {
  const PopularMovieLoaded({List<PopularMovieData>? data}) : super(data: data);

  @override
  List<Object?> get props => [data];
}

class PopularMovieFailed extends PopularMovieState {
  final Failure failure;

  const PopularMovieFailed({required this.failure});

  @override
  List<Object?> get props => [data, failure];
}
