import 'package:desafio_bloc_1/app/features/anime/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:faker/faker.dart';

class AnimeRepositorySpy extends Mock implements AnimeRepository {}

void main() {
  late GetAnimePostImpl sut;
  late AnimeRepositorySpy repository;
  late List<AnimeEntity> animes;
  late AnimePostDto dto;

  setUp(() {
    repository = AnimeRepositorySpy();
    sut = GetAnimePostImpl(repository: repository);
    animes = List.generate(
        faker.randomGenerator.integer(10), (index) => AnimeEntity(id: index, title: faker.lorem.word(), link: faker.internet.httpsUrl())).toList();

    dto = AnimePostDto(page: faker.randomGenerator.integer(10));
  });

  test('should return an anime list on success', () async {
    when(() => repository.getAnimePosts(dto: dto)).thenAnswer((invocation) async => Right(animes));

    final response = await sut(dto: dto);

    expect(response, Right<Failure, List<AnimeEntity>>(animes));

    verify(() => repository.getAnimePosts(dto: dto));
  });

  test('should return ServerFailure failure', () async {
    final response = await sut(dto: const AnimePostDto(page: -1));

    expect(response, Left<Failure, List<AnimeEntity>>(ServerFailure()));
  });
}
