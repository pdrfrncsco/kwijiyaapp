import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/quiz_entities.dart';
import '../../domain/entities/quiz_config.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/providers/core_providers.dart';

class QuizQuestionView extends ConsumerStatefulWidget {
  final QuizQuestion question;
  final int totalQuestions;
  final int currentIndex;
  final bool isSubmitting;
  final QuizConfig config;
  final void Function(String optionId, double timeTaken) onOptionSelected;

  const QuizQuestionView({
    super.key,
    required this.question,
    required this.totalQuestions,
    required this.currentIndex,
    required this.isSubmitting,
    required this.config,
    required this.onOptionSelected,
  });

  @override
  ConsumerState<QuizQuestionView> createState() => _QuizQuestionViewState();
}

class _QuizQuestionViewState extends ConsumerState<QuizQuestionView> {
  late Timer _timer;
  late double _timeLeft;
  late double _totalTime;
  final int _tickIntervalMs = 100;
  late List<QuizOption> _shuffledOptions;

  @override
  void initState() {
    super.initState();
    _randomizeOptions();
    _startTimer();
  }

  @override
  void didUpdateWidget(QuizQuestionView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.question.id != widget.question.id) {
      _randomizeOptions();
      _startTimer();
    }
  }

  void _randomizeOptions() {
    _shuffledOptions = List.of(widget.question.options)..shuffle();
  }

  void _startTimer() {
    // Use config timer
    _totalTime = widget.config.timerSeconds.toDouble();
    _timeLeft = _totalTime;

    _timer = Timer.periodic(Duration(milliseconds: _tickIntervalMs), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      final oldTime = _timeLeft;
      setState(() {
        _timeLeft -= (_tickIntervalMs / 1000);
        if (_timeLeft < 0) _timeLeft = 0;
      });

      // Play sound logic
      if (_timeLeft > 0 && _timeLeft.ceil() < oldTime.ceil()) {
        ref.read(soundServiceProvider).playTick();
      }

      if (_timeLeft <= 0) {
        timer.cancel();
        // Handle timeout if needed, currently just stops
      }
    });
  }

  Color _getTimerColor() {
    // Adjust warning thresholds based on total time
    if (_timeLeft > _totalTime * 0.5) return AppColors.success;
    if (_timeLeft > _totalTime * 0.25) return Colors.amber;
    return AppColors.error;
  }

  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }

  void _handleOptionTap(String optionId) {
    _timer.cancel();
    ref.read(soundServiceProvider).playClick();
    double timeTaken = _totalTime - _timeLeft;
    // Ensure at least some time is recorded
    if (timeTaken < 0.1) timeTaken = 0.1;
    widget.onOptionSelected(optionId, timeTaken);
  }

  @override
  Widget build(BuildContext context) {
    final optionLetters = ['A', 'B', 'C', 'D', 'E', 'F'];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: (widget.currentIndex + 1) / widget.totalQuestions,
                  backgroundColor: AppColors.surface,
                  color: AppColors.primary,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '${widget.currentIndex + 1}/${widget.totalQuestions}',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Timer Bar
          Stack(
            children: [
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              FractionallySizedBox(
                widthFactor: _totalTime > 0 ? (_timeLeft / _totalTime) : 0,
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: _getTimerColor(),
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: _timeLeft <= 5
                        ? [
                            BoxShadow(
                              color: AppColors.error.withValues(alpha: 0.5),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ]
                        : null,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            widget.question.questionText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24 * widget.config.fontSizeMultiplier,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 48),
          ..._shuffledOptions.asMap().entries.map((entry) {
            final index = entry.key;
            final option = entry.value;
            final letter = index < optionLetters.length
                ? optionLetters[index]
                : '';

            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: widget.isSubmitting
                    ? null
                    : () => _handleOptionTap(option.id),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  backgroundColor: AppColors.card,
                  foregroundColor: AppColors.textPrimary,
                  elevation: 2,
                  side: const BorderSide(color: AppColors.primary, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment:
                      Alignment.centerLeft, // Align content to start for prefix
                ),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 1),
                      ),
                      child: Text(
                        letter,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        option.text,
                        style: TextStyle(
                          fontSize: 18 * widget.config.fontSizeMultiplier,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          if (widget.isSubmitting)
            const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
        ],
      ),
    );
  }
}
