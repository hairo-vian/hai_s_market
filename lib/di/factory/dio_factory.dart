import 'package:dio/dio.dart';

class DioFactory {
  Dio create() {
    final Dio dio = Dio();
    const baseUrl = "https://www.dummyjson.com";
    dio.options = BaseOptions(
      receiveDataWhenStatusError: true,
      receiveTimeout: 30 * 1000,
      connectTimeout: 30 * 1000,
      sendTimeout: 30 * 1000,
      baseUrl: baseUrl,
      headers: {},
    );

    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestHeader: true,
      requestBody: true,
      error: true,
    ));

    return dio;
  }
}
