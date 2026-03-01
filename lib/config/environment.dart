enum EnvironmentType { dev, prod }

class Environment {
  static const String _defaultUrl = 'http://127.0.0.1:8000/api/v1';
  static const String _prodUrl = 'https://kwijiyapi.ndeas.cloud/api/v1';

  static EnvironmentType get current {
    const env = String.fromEnvironment('ENV', defaultValue: 'dev');
    return env == 'prod' ? EnvironmentType.prod : EnvironmentType.dev;
  }

  static String get apiUrl {
    if (current == EnvironmentType.prod) {
      return _prodUrl;
    }
    // Fallback or dev logic
    return const String.fromEnvironment('API_URL', defaultValue: _defaultUrl);
  }

  static bool get isProd => current == EnvironmentType.prod;
  static bool get isDev => current == EnvironmentType.dev;
}
