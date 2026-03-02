import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../config/environment.dart';
import 'token_manager.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  final TokenManager tokenManager;
  bool _isRefreshing = false;

  AuthInterceptor({required this.dio, required this.tokenManager});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await tokenManager.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && !_isRefreshing) {
      _isRefreshing = true;
      try {
        final refreshed = await _refreshToken();
        if (refreshed) {
          // Retry the original request with new token
          final token = await tokenManager.getToken();
          // Update the header of the failed request
          err.requestOptions.headers['Authorization'] = 'Bearer $token';

          // Retry the request using dio.fetch which accepts RequestOptions
          final response = await dio.fetch(err.requestOptions);

          handler.resolve(response);
          return;
        }
      } catch (e) {
        // Refresh failed - logout
        await tokenManager.clearTokens();
        // Here we should ideally navigate to login, but we don't have context.
        // The UI should handle 401 if it persists.
      } finally {
        _isRefreshing = false;
      }
    }
    handler.next(err);
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await tokenManager.getRefreshToken();
      if (refreshToken == null) return false;

      // Use a fresh Dio instance to avoid interceptors
      final refreshDio = Dio();
      final response = await refreshDio.post(
        '${Environment.apiUrl}/auth/token/refresh/',
        data: {'refresh': refreshToken},
      );

      if (response.statusCode == 200) {
        await tokenManager.saveToken(response.data['access']);
        return true;
      }
      return false;
    } catch (e) {
      if (kDebugMode) {
        print('Refresh token failed: $e');
      }
      return false;
    }
  }
}
