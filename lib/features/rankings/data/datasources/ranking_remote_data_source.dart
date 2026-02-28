import '../../../../core/network/api_client.dart';
import '../../domain/entities/ranking_entry.dart';

class RankingRemoteDataSource {
  final ApiClient _apiClient;

  RankingRemoteDataSource(this._apiClient);

  Future<List<RankingEntry>> getGlobalRanking() async {
    try {
      final response = await _apiClient.dio.get('/rankings/global/');
      final data = response.data as List;
      return data.map((e) => RankingEntry.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to load global ranking: $e');
    }
  }

  Future<List<RankingEntry>> getWeeklyRanking() async {
    try {
      final response = await _apiClient.dio.get('/rankings/weekly/');
      final data = response.data as List;
      return data.map((e) => RankingEntry.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to load weekly ranking: $e');
    }
  }
}
