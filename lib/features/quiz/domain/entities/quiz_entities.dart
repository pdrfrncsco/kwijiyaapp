// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_entities.freezed.dart';
part 'quiz_entities.g.dart';

@freezed
class QuizOption with _$QuizOption {
  const factory QuizOption({
    required String id,
    required String text,
  }) = _QuizOption;

  factory QuizOption.fromJson(Map<String, dynamic> json) => _$QuizOptionFromJson(json);
}

@freezed
class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({
    required String id,
    @JsonKey(name: 'question_type') required String questionType,
    required int difficulty,
    @JsonKey(name: 'question_text') required String questionText,
    @JsonKey(name: 'timer_seconds') required int timerSeconds,
    @JsonKey(name: 'xp_value') required int xpValue,
    required List<QuizOption> options,
  }) = _QuizQuestion;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) => _$QuizQuestionFromJson(json);
}

@freezed
class QuizSession with _$QuizSession {
  const factory QuizSession({
    @JsonKey(name: 'session_id') required String sessionId,
    required String language,
    required int level,
    @JsonKey(name: 'total_questions') required int totalQuestions,
    required List<QuizQuestion> questions,
  }) = _QuizSession;

  factory QuizSession.fromJson(Map<String, dynamic> json) => _$QuizSessionFromJson(json);
}

@freezed
class QuizResult with _$QuizResult {
  const factory QuizResult({
    @JsonKey(name: 'is_correct') required bool isCorrect,
    @JsonKey(name: 'xp_earned') required int xpEarned,
    @JsonKey(name: 'makuta_earned') required int makutaEarned,
    @JsonKey(name: 'correct_answer') String? correctAnswer,
    String? explanation,
    @JsonKey(name: 'cultural_note') String? culturalNote,
    @JsonKey(name: 'session_progress') required Map<String, dynamic> sessionProgress,
    @JsonKey(name: 'session_summary') Map<String, dynamic>? sessionSummary,
  }) = _QuizResult;

  factory QuizResult.fromJson(Map<String, dynamic> json) => _$QuizResultFromJson(json);
}
