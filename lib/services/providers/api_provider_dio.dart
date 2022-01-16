import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_std_utils/services/providers/api_provider.dart';
import 'package:l/l.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultRecieveTimeout = Duration.millisecondsPerMinute;

/// [Dio] implementation of ApiProvider
class ApiProviderDio extends ApiProvider {
  late Dio _dio;
  final List<Interceptor>? interceptors;

  ApiProviderDio({
    required String baseUrl,
    Dio? dio,
    this.interceptors,
  }) : super(baseUrl: baseUrl) {
    _dio = dio ?? Dio();
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultRecieveTimeout
      ..httpClientAdapter
      ..options.headers = {
        'Connection-Type': 'application/json; charset=UTF-8',
      };

    if (Platform.isAndroid) {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;

        return client;
      };
    }
  }

  @override
  void delAuthHeader() {
    _dio.options.headers.remove('Authorization');
  }

  @override
  void setAuthHeader(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  @override
  Future<T?> get<T>(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get<T>(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on FormatException catch (exc) {
      l.e(exc);
      throw const FormatException("Unable to proccess the data");
    } catch (exc) {
      l.e(exc);
      rethrow;
    }
  }

  @override
  Future<T?> post<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post<T>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on FormatException catch (exc) {
      l.e(exc);
      throw const FormatException("Unable to process the data");
    } catch (exc) {
      l.e(exc);
      rethrow;
    }
  }

  @override
  Future<T?> patch<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.patch<T>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } on FormatException catch (exc) {
      l.e(exc);
      throw const FormatException("Unable to process the data");
    } catch (exc) {
      l.e(exc);
      rethrow;
    }
  }
}
