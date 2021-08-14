import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:desafio_bloc_1/app/features/anime/domain/dtos/anime_post_dto.dart';
import 'package:desafio_bloc_1/app/features/anime/domain/errors/failures.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/anime_entity.dart';
import '../../../domain/usecases/get_anime_posts.dart';

part 'anime_event.dart';

part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final GetAnimePost usecase;
  int _page = 0;

  AnimeBloc({required this.usecase}) : super(AnimeInitialState());

  @override
  Stream<AnimeState> mapEventToState(AnimeEvent event) async* {
    if (event is AnimeFetchEvent) {
      yield* mapFetchEventToState(event);
    }
  }

  Stream<AnimeState> mapFetchEventToState(AnimeFetchEvent event) async* {
    final List<AnimeEntity> animes = [];
    if (state is AnimeSuccessState) {
      if ((state as AnimeSuccessState).hasReachedMax) yield state;
      final List<AnimeEntity> currentAnimes = (state as AnimeSuccessState).animes;
      animes.addAll(currentAnimes);
    }
    _page++;
    if (_page == 1) yield AnimeLoadingState();
    final response = await usecase(dto: AnimePostDto(page: _page));
    yield response.fold((l) {
      if (l is BadRequestFailure) return AnimeSuccessState(animes: animes, hasReachedMax: true);
      return AnimeFailureState();
    }, (r) => AnimeSuccessState(animes: animes..addAll(r), hasReachedMax: false));
  }
}
