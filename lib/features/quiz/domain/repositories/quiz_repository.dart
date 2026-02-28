import 'package:fpdart/fpdart.dart';
import '../entities/quiz_entities.dart';

abstract class QuizRepository {
  Future<Either<Exception, QuizSession>> startQuiz(String languageCode, int level);
  Future<Either<Exception, QuizResult>> submitAnswer({
    required String sessionId,
    required String questionId,
    required String optionId,
    required double timeTaken,
  });
}
