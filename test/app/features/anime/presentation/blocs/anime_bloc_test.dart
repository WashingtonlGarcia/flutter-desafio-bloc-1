import 'package:bloc_test/bloc_test.dart';
import 'package:desafio_bloc_1/app/features/anime/domain/domain.dart';
import 'package:desafio_bloc_1/app/features/anime/presentation/blocs/anime/anime_bloc.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

const success = TypeMatcher<AnimeSuccessState>();
const loading = TypeMatcher<AnimeLoadingState>();
const failure = TypeMatcher<AnimeFailureState>();

class GetAnimePostSpy extends Mock implements GetAnimePostImpl {}

void main() {
  late AnimeBloc sut;
  late GetAnimePostImpl usecase;
  late List<AnimeEntity> animes;

  setUp(() {
    usecase = GetAnimePostSpy();
    sut = AnimeBloc(usecase: usecase);
    animes = List.generate(
        faker.randomGenerator.integer(10), (index) => AnimeEntity(id: index, title: faker.lorem.word(), link: faker.internet.httpsUrl())).toList();
  });

  tearDown(() {
    sut.close();
  });

  blocTest<AnimeBloc, AnimeState>(
    'should return a list animes From the usecase',
    build: () => sut,
    act: (bloc) async {
      when(() => usecase(dto: any(named: 'dto'))).thenAnswer((invocation) async => Right(animes));

      bloc.add(AnimeFetchEvent());
    },
    expect: () => [AnimeLoadingState(), AnimeSuccessState(animes: animes, hasReachedMax: false)],
  );
}
