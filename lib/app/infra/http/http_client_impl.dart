import 'package:dio/dio.dart';
import '../../core/errors/exceptions.dart';
import 'http_client.dart';

class HttpClientImpl implements HttpClient {
  final Dio dio;

  HttpClientImpl({required this.dio});

  @override
  Future<HttpResponse> get({required String url, Map<String, String>? headers}) async {
    try {
      final response = await dio.get(url, options: Options(headers: headers));
      return HttpResponse(data: response.data, code: response.statusCode);
    } on DioError catch (error) {
      throw error.response!.statusCode == 400 ? BadRequestException() : ServerException();
    } catch (_) {
      throw ServerException();
    }
  }
}
