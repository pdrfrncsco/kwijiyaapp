import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/providers/core_providers.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/datasources/quiz_remote_data_source.dart';
import '../../data/repositories/quiz_repository_impl.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../../domain/entities/quiz_entities.dart';

part 'quiz_providers.g.dart';

@riverpod
QuizRemoteDataSource quizRemoteDataSource(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return QuizRemoteDataSource(apiClient);
}

@riverpod
QuizRepository quizRepository(Ref ref) {
  final remoteDataSource = ref.watch(quizRemoteDataSourceProvider);
  return QuizRepositoryImpl(remoteDataSource);
}

class QuizState {
  final AsyncValue<QuizSession?> session;
  final int currentQuestionIndex;
  final AsyncValue<QuizResult?> lastResult;
  final bool isAnswerSubmitting;
  final bool isCompleted;

  const QuizState({
    required this.session,
    this.currentQuestionIndex = 0,
    required this.lastResult,
    this.isAnswerSubmitting = false,
    this.isCompleted = false,
  });

  QuizState copyWith({
    AsyncValue<QuizSession?>? session,
    int? currentQuestionIndex,
    AsyncValue<QuizResult?>? lastResult,
    bool? isAnswerSubmitting,
    bool? isCompleted,
  }) {
    return QuizState(
      session: session ?? this.session,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      lastResult: lastResult ?? this.lastResult,
      isAnswerSubmitting: isAnswerSubmitting ?? this.isAnswerSubmitting,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

@riverpod
class QuizController extends _$QuizController {
  @override
  QuizState build() {
    return const QuizState(
      session: AsyncValue.data(null),
      lastResult: AsyncValue.data(null),
    );
  }

  Future<void> startQuiz(String languageCode, int level) async {
    state = state.copyWith(
      session: const AsyncValue.loading(),
      currentQuestionIndex: 0,
      isCompleted: false,
      lastResult: const AsyncValue.data(null),
    );

    final repository = ref.read(quizRepositoryProvider);
    final result = await repository.startQuiz(languageCode, level);

    state = result.fold(
      (error) =>
          state.copyWith(session: AsyncValue.error(error, StackTrace.current)),
      (session) => state.copyWith(session: AsyncValue.data(session)),
    );
  }

  Future<void> submitAnswer(String optionId, double timeTaken) async {
    final sessionValue = state.session.value;
    if (sessionValue == null) return;

    final question = sessionValue.questions[state.currentQuestionIndex];

    state = state.copyWith(isAnswerSubmitting: true);

    final repository = ref.read(quizRepositoryProvider);
    final result = await repository.submitAnswer(
      sessionId: sessionValue.sessionId,
      questionId: question.id,
      optionId: optionId,
      timeTaken: timeTaken,
    );

    result.fold(
      (error) {
        state = state.copyWith(
          isAnswerSubmitting: false,
          lastResult: AsyncValue.error(error, StackTrace.current),
        );
      },
      (quizResult) {
        state = state.copyWith(
          isAnswerSubmitting: false,
          lastResult: AsyncValue.data(quizResult),
        );

        if (quizResult.sessionProgress['is_completed'] == true) {
          // Do not complete immediately to allow feedback view
          // state = state.copyWith(isCompleted: true);
          ref.invalidate(authControllerProvider);
        }
      },
    );
  }

  void nextQuestion() {
    final sessionValue = state.session.value;
    if (sessionValue == null) return;

    if (state.currentQuestionIndex < sessionValue.questions.length - 1) {
      state = state.copyWith(
        currentQuestionIndex: state.currentQuestionIndex + 1,
        lastResult: const AsyncValue.data(null),
      );
    } else {
      state = state.copyWith(isCompleted: true);
    }
  }
}
