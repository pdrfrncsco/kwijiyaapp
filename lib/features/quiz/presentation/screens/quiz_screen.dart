import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/providers/core_providers.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../domain/entities/quiz_config.dart';
import '../providers/quiz_providers.dart';
import 'quiz_question_view.dart';
import 'quiz_result_view.dart';

class QuizScreen extends ConsumerStatefulWidget {
  final String languageCode;
  final int level;

  const QuizScreen({
    super.key,
    required this.languageCode,
    required this.level,
  });

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  @override
  void initState() {
    super.initState();
    // Start quiz on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(quizControllerProvider.notifier)
          .startQuiz(widget.languageCode, widget.level);
      ref.read(soundServiceProvider).startBackgroundMusic();
    });
  }

  @override
  void dispose() {
    ref.read(soundServiceProvider).stopBackgroundMusic();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quizState = ref.watch(quizControllerProvider);
    final userAsync = ref.watch(authControllerProvider);
    final user = userAsync.valueOrNull;
    final config = QuizConfig.forAgeGroup(user?.ageGroup);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            // Confirm exit
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Sair do Quiz?'),
                content: const Text('Seu progresso nesta sessão será perdido.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.pop();
                    },
                    child: const Text('Sair'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      body: quizState.session.when(
        data: (session) {
          if (session == null) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (quizState.isCompleted) {
            final sessionSummary =
                quizState.lastResult.value?.sessionSummary ?? {};
            return _QuizSummaryView(
              summary: sessionSummary,
              onHome: () => context.pop(),
            );
          }

          final question = session.questions[quizState.currentQuestionIndex];

          // Check if we are showing the result of the last answer (feedback)
          final lastResult = quizState.lastResult.value;
          if (lastResult != null) {
            return QuizResultView(
              result: lastResult,
              onNext: () {
                ref.read(quizControllerProvider.notifier).nextQuestion();
              },
            );
          }

          return QuizQuestionView(
            question: question,
            totalQuestions: session.totalQuestions,
            currentIndex: quizState.currentQuestionIndex,
            isSubmitting: quizState.isAnswerSubmitting,
            config: config,
            onOptionSelected: (optionId, timeTaken) {
              ref
                  .read(quizControllerProvider.notifier)
                  .submitAnswer(optionId, timeTaken);
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (err, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: AppColors.error),
              const SizedBox(height: 16),
              Text('Erro ao iniciar quiz:\n$err', textAlign: TextAlign.center),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref
                    .read(quizControllerProvider.notifier)
                    .startQuiz(widget.languageCode, widget.level),
                child: const Text('Tentar novamente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuizSummaryView extends ConsumerStatefulWidget {
  final Map<String, dynamic> summary;
  final VoidCallback onHome;

  const _QuizSummaryView({required this.summary, required this.onHome});

  @override
  ConsumerState<_QuizSummaryView> createState() => _QuizSummaryViewState();
}

class _QuizSummaryViewState extends ConsumerState<_QuizSummaryView> {
  @override
  void initState() {
    super.initState();
    ref.read(soundServiceProvider).stopBackgroundMusic();
    ref.read(soundServiceProvider).playSuccess();
  }

  @override
  Widget build(BuildContext context) {
    final totalXp = widget.summary['total_xp'] ?? 0;
    final totalMakuta = widget.summary['total_makuta'] ?? 0;
    final accuracy = widget.summary['accuracy'] ?? 0.0;
    final correct = widget.summary['correct'] ?? 0;
    final total = widget.summary['total'] ?? 0;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 80, color: AppColors.success),
            const SizedBox(height: 24),
            const Text(
              'Sessão Concluída!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Você acertou $correct de $total questões!',
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _SummaryItem(
                  icon: Icons.star,
                  color: AppColors.primary,
                  label: 'XP Ganho',
                  value: '+$totalXp',
                ),
                _SummaryItem(
                  icon: Icons.monetization_on,
                  color: Colors.amber,
                  label: 'Makuta',
                  value: '+$totalMakuta',
                ),
                _SummaryItem(
                  icon: Icons.pie_chart,
                  color: Colors.blue,
                  label: 'Precisão',
                  value: '${accuracy.toStringAsFixed(0)}%',
                ),
              ],
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: widget.onHome,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Voltar ao Início'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final String value;

  const _SummaryItem({
    required this.icon,
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 32),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
