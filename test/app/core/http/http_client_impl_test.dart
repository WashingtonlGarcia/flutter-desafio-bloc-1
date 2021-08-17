import 'package:desafio_bloc_1/app/core/http/http_client_impl.dart';
import 'package:desafio_bloc_1/app/features/anime/external/external.dart';
import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioSpy extends Mock implements Dio {}

void main() {
  late DioSpy dio;
  late HttpClientImpl sut;
  late String url;
  setUp(() {
    dio = DioSpy();
    sut = HttpClientImpl(dio: dio);
    url = faker.internet.httpsUrl();
  });

  test('', () {
    when(() => dio.get(url, options: Options(headers: any(named: 'headers')))).thenThrow(
        DioError(response: Response(statusCode: 400, requestOptions: RequestOptions(path: url)), requestOptions: RequestOptions(path: url)));

    final response = sut.get(url: url);

    expect(response, throwsA(ServerException()));
  });
}
