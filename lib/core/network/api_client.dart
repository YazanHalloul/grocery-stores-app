import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://api.orianosy.com",
      headers: {'secretKey': const String.fromEnvironment("SECRET_KEY")},
      queryParameters: {'deviceKind': 'mobile'},
    ),
  );

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }
}
