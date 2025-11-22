import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../configs/app_config.dart';

class ApiClient {
  ApiClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: AppConfig.baseUrl,
          connectTimeout: const Duration(seconds: 12),
          receiveTimeout: const Duration(seconds: 12),
          sendTimeout: const Duration(seconds: 12),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      ) {
    dio.interceptors.addAll([AuthInterceptor(), ErrorInterceptor()]);
  }
  final Dio dio;
}

class AuthInterceptor extends Interceptor {
  String? _accessToken = '';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('➡️ ${options.method} ${options.baseUrl}${options.path}');
    debugPrint('Headers: ${options.headers}');
    debugPrint('Body: ${options.data}');

    if (_accessToken?.isNotEmpty ?? false) {
      options.headers['Authorization'] = 'Bearer $_accessToken';
    }

    handler.next(options);
  }

  void updateToken(String token) {
    _accessToken = token;
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('❌ API Error: ${err.message}');

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      return handler.reject(
        _customError(err, 'No internet connection. Try again.'),
      );
    }

    if (err.type == DioExceptionType.connectionError) {
      return handler.reject(
        _customError(err, 'Network unreachable. Try later.'),
      );
    }

    if (err.response != null) {
      // New error format: { "success": false, "message": "...", "error_code": "...", ... }
      final message = err.response?.data['message'] ?? 'Something went wrong';

      return handler.reject(_customError(err, message));
    }

    return handler.reject(_customError(err, 'Unexpected error occurred'));
  }

  DioException _customError(DioException err, String message) {
    return DioException(
      requestOptions: err.requestOptions,
      message: message,
      type: DioExceptionType.badResponse,
    );
  }
}

class CustomException implements Exception {
  CustomException(this.message);
  final String message;

  @override
  String toString() => message;
}
