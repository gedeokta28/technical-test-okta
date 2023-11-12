import 'package:equatable/equatable.dart';
import 'package:technical_test_okta/core/errors/failures.dart';

abstract class FavoriteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavoriteEmpty extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteFailure extends FavoriteState {
  final Failure failure;

  FavoriteFailure({required this.failure});

  @override
  List<Object?> get props => [failure];
}

class FavoriteChanged extends FavoriteState {
  final bool favStatus;

  FavoriteChanged({required this.favStatus});

  @override
  List<Object> get props => [favStatus];
}
