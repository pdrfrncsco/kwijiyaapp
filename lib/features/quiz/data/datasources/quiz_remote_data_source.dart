import '../../../../core/network/api_client.dart';
import '../../domain/entities/quiz_entities.dart';

class QuizRemoteDataSource {
  final ApiClient _apiClient;

  QuizRemoteDataSource(this._apiClient);

  Future<QuizSession> startQuiz(String languageCode, int level) async {
    try {
      final response = await _apiClient.dio.post(
        '/quizzes/start/',
        data: {
          'language_code': languageCode,
          'level': level,
          'num_questions': 5, // Default for MVP
        },
      );
      return QuizSession.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to start quiz: $e');
    }
  }

  Future<QuizResult> submitAnswer({
    required String sessionId,
    required String questionId,
    required String optionId,
    required double timeTaken,
  }) async {
    try {
      final response = await _apiClient.dio.post(
        '/quizzes/submit/',
        data: {
          'session_id': sessionId,
          'question_id': questionId,
          'option_id': optionId,
          'time_taken': timeTaken,
        },
      );
      return QuizResult.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to submit answer: $e');
    }
  }

  Future<List<QuizQuestion>> getPlacementQuestions() async {
    try {
      final response = await _apiClient.dio.post('/quizzes/placement/start/');
      final questionsData = response.data['questions'] as List;
      return questionsData.map((e) => QuizQuestion.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to start placement test: $e');
    }
  }

  Future<Map<String, dynamic>> submitPlacementTest(int correctCount) async {
    try {
      final response = await _apiClient.dio.post(
        '/quizzes/placement/submit/',
        data: {'correct_count': correctCount, 'total_questions': 5},
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to submit placement test: $e');
    }
  }
}
