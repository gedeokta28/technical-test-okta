import 'package:equatable/equatable.dart';
import 'package:technical_test_okta/core/errors/failures.dart';
import 'package:technical_test_okta/features/detail/domain/entities/detail_movie.dart';

abstract class DetailMovieState extends Equatable {
  final DetailMovieData? data;

  const DetailMovieState({this.data});

  @override
  List<Object?> get props => [data];
}

class DetailMovieInitial extends DetailMovieState {}

class DetailMovieLoading extends DetailMovieState {}

class DetailMovieLoaded extends DetailMovieState {
  const DetailMovieLoaded({DetailMovieData? data}) : super(data: data);

  @override
  List<Object?> get props => [data];
}

class DetailMovieFailed extends DetailMovieState {
  final Failure failure;

  const DetailMovieFailed({required this.failure});

  @override
  List<Object?> get props => [data, failure];
}
