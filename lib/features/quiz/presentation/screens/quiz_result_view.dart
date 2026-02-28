import 'package:flutter/material.dart';
import '../../domain/entities/quiz_entities.dart';
import '../../../../core/theme/app_colors.dart';

class QuizResultView extends StatelessWidget {
  final QuizResult result;
  final VoidCallback onNext;

  const QuizResultView({
    super.key,
    required this.result,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final isCorrect = result.isCorrect;
    
    return Center(
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
                '+${result.xpEarned} XP',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              )
            else if (result.correctAnswer != null)
              Column(
                children: [
                  const Text('Resposta correcta:', style: TextStyle(color: AppColors.textSecondary)),
                  const SizedBox(height: 4),
                  Text(
                    result.correctAnswer!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            if (result.explanation != null && result.explanation!.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              Text(
                result.explanation!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: isCorrect ? AppColors.success : AppColors.error,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
