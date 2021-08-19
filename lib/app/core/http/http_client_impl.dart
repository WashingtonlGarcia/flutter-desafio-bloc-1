
import 'package:desafio_bloc_1/app/features/anime/external/external.dart';
import 'package:dio/dio.dart';

import 'http_client.dart';

class HttpClientImpl implements HttpClient {
  final Dio dio;

  HttpClientImpl({required this.dio});

  @override
  Future<HttpResponse> get({required String url}) async {
    try {
      final response = await dio.get(url);
      return HttpResponse(data: response.data, code: response.statusCode);
    } on DioError catch (error) {
      throw error.response!.statusCode == 400 ? BadRequestException() : ServerException();
    } catch (_) {
      throw ServerException();
    }
  }
}
