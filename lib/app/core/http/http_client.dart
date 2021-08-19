import 'package:equatable/equatable.dart';

abstract class HttpClient {
  Future<HttpResponse> get({required String url});
}

class HttpResponse extends Equatable {
  final int? code;
  final dynamic data;

  const HttpResponse({required this.code, required this.data});

  @override
  List<Object?> get props => [code, data];
}
