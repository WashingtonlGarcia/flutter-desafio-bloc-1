part of 'anime_bloc.dart';

abstract class AnimeEvent extends Equatable {}

class AnimeStartedEvent extends AnimeEvent {
  @override
  List<Object?> get props => [];
}

class AnimeFetchEvent extends AnimeEvent {
  @override
  List<Object?> get props => [];
}
