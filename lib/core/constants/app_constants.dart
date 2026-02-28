import '../../config/environment.dart';

class AppConstants {
  static const String appName = 'Kwijiya';

  // API URLs
  static String get baseUrlAndroid => Environment.apiUrl;
  static String get baseUrlIOS => Environment.apiUrl;
  static String get baseUrlWeb => Environment.apiUrl;

  // Keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
  static const String themeKey = 'theme_mode';

  // Timeouts
  static const int connectTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds
}
