import 'package:desafio_bloc_1/app/core/http/http_client.dart';
import 'package:desafio_bloc_1/app/features/anime/domain/domain.dart';
import 'package:desafio_bloc_1/app/features/anime/external/adapters/anime_adapter.dart';
import 'package:desafio_bloc_1/app/features/anime/external/datasources/anime_remote_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  late AnimeRemoteDataSourceImpl sut;
  late HttpClient httpClient;
  late AnimePostDto dto;
  late List<Map<String, dynamic>> data;

  setUp(() {
    httpClient = HttpClientSpy();
    sut = AnimeRemoteDataSourceImpl(httpClient: httpClient);
    dto = AnimePostDto(page: faker.randomGenerator.integer(10));
    data = List.generate(
        15,
        (index) => {
              'id': index,
              'title': {'rendered': faker.lorem.word()},
              'link': faker.internet.httpsUrl(),
            });
  });

  test('should return an anime list on success', () async {
    when(() => httpClient.get(url: any(named: 'url'))).thenAnswer((invocation) async => HttpResponse(data: data, code: 200));

    final response = await sut.getAnimePosts(dto: dto);

    expect(response, AnimeAdapter.fromList(list: data));

    verify(() => httpClient.get(url: any(named: 'url')));
  });
}
