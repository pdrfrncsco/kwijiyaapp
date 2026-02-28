class AppConstants {
  static const String appName = 'Kwijiya';
  
  // API URLs
  // Use 10.0.2.2 for Android emulator to access localhost
  static const String baseUrlAndroid = 'http://10.0.2.2:8000/api/v1';
  static const String baseUrlIOS = 'http://localhost:8000/api/v1';
  static const String baseUrlWeb = 'http://localhost:8000/api/v1';
  
  // Keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
  static const String themeKey = 'theme_mode';
  
  // Timeouts
  static const int connectTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds
}
