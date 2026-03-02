import 'package:fpdart/fpdart.dart';
import '../../data/datasources/quiz_remote_data_source.dart';
import '../../domain/entities/quiz_entities.dart';
import '../../domain/repositories/quiz_repository.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizRemoteDataSource _remoteDataSource;

  QuizRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Exception, QuizSession>> startQuiz(
    String languageCode,
    int level,
  ) async {
    try {
      final session = await _remoteDataSource.startQuiz(languageCode, level);
      return Right(session);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, QuizResult>> submitAnswer({
    required String sessionId,
    required String questionId,
    required String optionId,
    required double timeTaken,
  }) async {
    try {
      final result = await _remoteDataSource.submitAnswer(
        sessionId: sessionId,
        questionId: questionId,
        optionId: optionId,
        timeTaken: timeTaken,
      );
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<QuizQuestion>>> getPlacementQuestions() async {
    try {
      final questions = await _remoteDataSource.getPlacementQuestions();
      return Right(questions);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, Map<String, dynamic>>> submitPlacementTest(
    int correctCount,
  ) async {
    try {
      final result = await _remoteDataSource.submitPlacementTest(correctCount);
      return Right(result);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
