import 'dart:io';

import 'package:conectar_challenge_front/modules/shared/external/datasources/interceptors/auth_interceptor.dart';
import 'package:conectar_challenge_front/modules/shared/external/datasources/interceptors/debug_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiDatasource {
  static Dio? _dio;

  ApiDatasource() {
    if (_dio != null) return;

    _dio ??= Dio(
      BaseOptions(
        baseUrl: 'http://localhost:3000',
        headers: {'Content-Type': ContentType.json.toString(), 'responseType': 'json'},
      ),
    );
    _dio!.interceptors.add(AuthInterceptor());
    if (kDebugMode) {
      _dio!.interceptors.add(DebugInterceptor());
    }
  }

  Future<Response> get(String uri, {Map<String, dynamic>? query, Map<String, dynamic>? headers}) {
    return _dio!.get(
      uri,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }

  Future<Response> post(String uri, {dynamic data, Map<String, dynamic>? query, Map<String, dynamic>? headers}) {
    return _dio!.post(
      uri,
      data: data,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }

  Future<Response> put(String uri, {dynamic data, Map<String, dynamic>? query, Map<String, dynamic>? headers}) {
    return _dio!.put(
      uri,
      data: data,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }

  Future<dynamic> delete(String uri, {Map<String, dynamic>? query, Map<String, dynamic>? headers}) {
    return _dio!.delete(
      uri,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }
}
