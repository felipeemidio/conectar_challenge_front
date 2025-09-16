// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class DebugInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(
      'DIO REQUEST[${options.method}] => PATH: ${options.path}${options.data != null ? ' => BODY: ${options.data}' : ''}${options.queryParameters.isNotEmpty ? ' => QUERY: ${options.queryParameters}' : ''} => HEADERS: ${options.headers}',
    );
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'DIO RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}${response.data != null ? ' => DATA: ${response.data}' : ''}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print(
      'DIO ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}${err.response?.data != null ? ' => DATA: ${err.response?.data}' : ''}',
    );
    return super.onError(err, handler);
  }
}
