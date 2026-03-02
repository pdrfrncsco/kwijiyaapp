import 'package:flutter/foundation.dart';

class Environment {
  static const bool isDev = true;

  static String get baseUrl {
    if (isDev) {
      if (kIsWeb) return 'http://127.0.0.1:8005';
      if (defaultTargetPlatform == TargetPlatform.android) {
        return 'http://10.0.2.2:8005';
      }
      return 'http://127.0.0.1:8005';
    } else {
      return 'https://kwijiyapi.ndeas.cloud';
    }
  }

  static String get apiUrl => '$baseUrl/api/v1';
}
