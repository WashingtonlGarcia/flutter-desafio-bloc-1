part of 'anime_bloc.dart';

abstract class AnimeState extends Equatable {}

class AnimeInitialState extends AnimeState {
  @override
  List<Object?> get props => [];
}

class AnimeLoadingState extends AnimeState {
  @override
  List<Object?> get props => [];
}

class AnimeSuccessState extends AnimeState {
  final List<AnimeEntity> animes;
  final bool hasReachedMax;

  AnimeSuccessState({required this.animes, required this.hasReachedMax});

  @override
  List<Object?> get props => [animes, hasReachedMax];
}

class AnimeFailureState extends AnimeState {
  @override
  List<Object?> get props => [];
}
