import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../utils/global_keys.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Skip 401 as it's handled by AuthInterceptor
    if (err.response?.statusCode == 401) {
      handler.next(err);
      return;
    }

    String message = 'Ocorreu um erro inesperado.';

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.connectionError) {
      message = 'Sem conexão com a internet. Verifique sua rede.';
    } else if (err.response != null) {
      final statusCode = err.response!.statusCode;
      if (statusCode != null && statusCode >= 500) {
        message = 'Erro no servidor. Tente novamente mais tarde.';
      } else if (statusCode != null && statusCode >= 400) {
        // Try to parse error message from response
        final data = err.response!.data;
        if (data is Map) {
          if (data.containsKey('error')) {
            message = data['error'].toString();
          } else if (data.containsKey('detail')) {
            message = data['detail'].toString();
          } else if (data.containsKey('message')) {
            message = data['message'].toString();
          } else {
            // If errors is a list or other format, take the first one if possible
            // e.g. {"email": ["Invalid email"]}
            final keys = data.keys;
            if (keys.isNotEmpty) {
              final firstKey = keys.first;
              final firstValue = data[firstKey];
              if (firstValue is List && firstValue.isNotEmpty) {
                message = '$firstKey: ${firstValue.first}';
              } else {
                message = '$firstKey: $firstValue';
              }
            }
          }
        } else {
          message = 'Erro na solicitação ($statusCode).';
        }
      }
    }

    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );

    handler.next(err);
  }
}
