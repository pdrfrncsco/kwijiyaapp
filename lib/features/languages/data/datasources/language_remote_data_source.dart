import '../../../../core/network/api_client.dart';
import '../../domain/entities/language.dart';

class LanguageRemoteDataSource {
  final ApiClient _apiClient;

  LanguageRemoteDataSource(this._apiClient);

  Future<List<Language>> getLanguages() async {
    try {
      final response = await _apiClient.dio.get('/languages/');

      // Handle pagination
      List data;
      if (response.data is Map && response.data.containsKey('results')) {
        data = response.data['results'];
      } else if (response.data is List) {
        data = response.data;
      } else {
        throw Exception('Unexpected response format');
      }

      return data.map((e) => Language.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to load languages: $e');
    }
  }
}
