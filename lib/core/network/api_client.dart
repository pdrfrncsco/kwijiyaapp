import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../constants/app_constants.dart';
import 'auth_interceptor.dart';
import 'error_interceptor.dart';
import 'token_manager.dart';

class ApiClient {
  final Dio _dio;
  final TokenManager _tokenManager;

  ApiClient(this._tokenManager)
    : _dio = Dio(
        BaseOptions(
          baseUrl: kIsWeb
              ? AppConstants.baseUrlWeb
              : Platform.isAndroid
              ? AppConstants.baseUrlAndroid
              : AppConstants.baseUrlIOS,
          connectTimeout: const Duration(
            milliseconds: AppConstants.connectTimeout,
          ),
          receiveTimeout: const Duration(
            milliseconds: AppConstants.receiveTimeout,
          ),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    _dio.interceptors.add(
      AuthInterceptor(dio: _dio, tokenManager: _tokenManager),
    );

    _dio.interceptors.add(ErrorInterceptor());

    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
  }

  Dio get dio => _dio;
}
