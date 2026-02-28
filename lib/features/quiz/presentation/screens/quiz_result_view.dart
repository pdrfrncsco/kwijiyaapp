import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';
import '../../domain/entities/quiz_entities.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/providers/core_providers.dart';

class QuizResultView extends ConsumerStatefulWidget {
  final QuizResult result;
  final VoidCallback onNext;

  const QuizResultView({super.key, required this.result, required this.onNext});

  @override
  ConsumerState<QuizResultView> createState() => _QuizResultViewState();
}

class _QuizResultViewState extends ConsumerState<QuizResultView>
    with SingleTickerProviderStateMixin {
  late ConfettiController _confettiController;
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 2),
    );

    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _shakeAnimation = Tween<double>(
      begin: 0,
      end: 10,
    ).chain(CurveTween(curve: Curves.elasticIn)).animate(_shakeController);

    if (widget.result.isCorrect) {
      _confettiController.play();
      ref.read(soundServiceProvider).playCorrect();
    } else {
      _shakeController.forward().then((_) => _shakeController.reverse());
      ref.read(soundServiceProvider).playWrong();
    }
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isCorrect = widget.result.isCorrect;

    return Stack(
      children: [
        Center(
          child: AnimatedBuilder(
            animation: _shakeAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: isCorrect
                    ? Offset.zero
                    : Offset(sin(_shakeController.value * pi * 4) * 10, 0),
                child: child,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: isCorrect ? AppColors.success : AppColors.error,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: (isCorrect ? AppColors.success : AppColors.error)
                        .withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    isCorrect ? Icons.check_circle : Icons.cancel,
                    size: 80,
                    color: isCorrect ? AppColors.success : AppColors.error,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isCorrect ? 'Correcto!' : 'Errado!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isCorrect ? AppColors.success : AppColors.error,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (isCorrect)
                    Text(
                      '+${widget.result.xpEarned} XP',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    )
                  else if (widget.result.correctAnswer != null)
                    Column(
                      children: [
                        const Text(
                          'Resposta correcta:',
                          style: TextStyle(color: AppColors.textSecondary),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.result.correctAnswer!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  if (widget.result.explanation != null &&
                      widget.result.explanation!.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      widget.result.explanation!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: widget.onNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isCorrect
                          ? AppColors.success
                          : AppColors.error,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Continuar'),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isCorrect)
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple,
              ],
            ),
          ),
      ],
    );
  }
}
