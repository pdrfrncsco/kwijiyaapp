// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizOptionImpl _$$QuizOptionImplFromJson(Map<String, dynamic> json) =>
    _$QuizOptionImpl(id: json['id'] as String, text: json['text'] as String);

Map<String, dynamic> _$$QuizOptionImplToJson(_$QuizOptionImpl instance) =>
    <String, dynamic>{'id': instance.id, 'text': instance.text};

_$QuizQuestionImpl _$$QuizQuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuizQuestionImpl(
      id: json['id'] as String,
      questionType: json['question_type'] as String,
      difficulty: (json['difficulty'] as num).toInt(),
      questionText: json['question_text'] as String,
      timerSeconds: (json['timer_seconds'] as num).toInt(),
      xpValue: (json['xp_value'] as num).toInt(),
      options: (json['options'] as List<dynamic>)
          .map((e) => QuizOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuizQuestionImplToJson(_$QuizQuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_type': instance.questionType,
      'difficulty': instance.difficulty,
      'question_text': instance.questionText,
      'timer_seconds': instance.timerSeconds,
      'xp_value': instance.xpValue,
      'options': instance.options,
    };

_$QuizSessionImpl _$$QuizSessionImplFromJson(Map<String, dynamic> json) =>
    _$QuizSessionImpl(
      sessionId: json['session_id'] as String,
      language: json['language'] as String,
      level: (json['level'] as num).toInt(),
      totalQuestions: (json['total_questions'] as num).toInt(),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuizSessionImplToJson(_$QuizSessionImpl instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'language': instance.language,
      'level': instance.level,
      'total_questions': instance.totalQuestions,
      'questions': instance.questions,
    };

_$QuizResultImpl _$$QuizResultImplFromJson(Map<String, dynamic> json) =>
    _$QuizResultImpl(
      isCorrect: json['is_correct'] as bool,
      xpEarned: (json['xp_earned'] as num).toInt(),
      makutaEarned: (json['makuta_earned'] as num).toInt(),
      correctAnswer: json['correct_answer'] as String?,
      explanation: json['explanation'] as String?,
      culturalNote: json['cultural_note'] as String?,
      sessionProgress: json['session_progress'] as Map<String, dynamic>,
      sessionSummary: json['session_summary'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$QuizResultImplToJson(_$QuizResultImpl instance) =>
    <String, dynamic>{
      'is_correct': instance.isCorrect,
      'xp_earned': instance.xpEarned,
      'makuta_earned': instance.makutaEarned,
      'correct_answer': instance.correctAnswer,
      'explanation': instance.explanation,
      'cultural_note': instance.culturalNote,
      'session_progress': instance.sessionProgress,
      'session_summary': instance.sessionSummary,
    };
