import 'package:desafio_bloc_1/app/features/anime/external/external.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:faker/faker.dart';

class AnimeRemoteDataSourceSpy extends Mock implements AnimeRemoteDataSource {}

void main() {
  late AnimeRemoteDataSource dataSource;
  late AnimeRepository sut;
  late AnimePostDto dto;
  late List<AnimeEntity> animes;

  void verifyGetAnimePosts() => verify(() => dataSource.getAnimePosts(dto: dto));
  void requestSucess({required List<AnimeEntity> animes}) => when(() => dataSource.getAnimePosts(dto: dto)).thenAnswer((invocation) async => animes);
  void requestFailure({required Exception exception}) => when(() => dataSource.getAnimePosts(dto: dto)).thenThrow(exception);

  setUp(() {
    dataSource = AnimeRemoteDataSourceSpy();
    sut = AnimeRepositoryImpl(dataSource: dataSource);
    dto = AnimePostDto(page: faker.randomGenerator.integer(10));
    animes = List.generate(
        faker.randomGenerator.integer(10), (index) => AnimeEntity(id: index, title: faker.lorem.word(), link: faker.internet.httpsUrl())).toList();
    requestSucess(animes: animes);
  });

  test('should return an anime list on success', () async {
    final response = await sut.getAnimePosts(dto: dto);

    expect(response, Right<Failure, List<AnimeEntity>>(animes));

    verifyGetAnimePosts();
  });

  test('should return ServerFailure failure', () async {
    requestFailure(exception: ServerException());

    final response = await sut.getAnimePosts(dto: dto);

    expect(response, Left<Failure, List<AnimeEntity>>(ServerFailure()));

    verifyGetAnimePosts();
  });

  test('should return BadRequestFailure failure', () async {
    requestFailure(exception: BadRequestException());

    final response = await sut.getAnimePosts(dto: dto);

    expect(response, Left<Failure, List<AnimeEntity>>(BadRequestFailure()));

    verifyGetAnimePosts();
  });
}
