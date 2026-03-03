// =============================================================================
// KWIJIYA — Flutter Adaptive Mode System
// Ficheiro: lib/core/adaptive/age_mode.dart
// =============================================================================
// Este ficheiro define o sistema completo de modos adaptativos Criança/Adulto.
// Inclui:
//   - AgeMode enum
//   - SessionConfig por modo
//   - AdaptiveTheme
//   - Providers Riverpod
//   - AgeSelectionPage (onboarding)
//   - QuizPage adaptativa
// =============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ─────────────────────────────────────────────────────────────────────────────
// ENUMS E DATA CLASSES
// ─────────────────────────────────────────────────────────────────────────────

enum AgeMode { child, teen, adult }

extension AgeModeExtension on AgeMode {
  String get apiValue => name; // 'child', 'teen', 'adult'

  String get displayName {
    switch (this) {
      case AgeMode.child:
        return 'Criança';
      case AgeMode.teen:
        return 'Jovem';
      case AgeMode.adult:
        return 'Adulto';
    }
  }

  String get emoji {
    switch (this) {
      case AgeMode.child:
        return '👦';
      case AgeMode.teen:
        return '👨‍🎓';
      case AgeMode.adult:
        return '👤';
    }
  }
}

/// Configuração de sessão de quiz por faixa etária.
/// Deve espelhar SESSION_CONFIGS do backend (quizzes/session_config.py).
class SessionConfig {
  final int questionsPerSession;
  final int timerSeconds;
  final double xpMultiplier;
  final int makutaPerCorrect;
  final bool showRanking;
  final bool showStreakPressure;
  final bool showStatisticsDetail;
  final String feedbackStyle; // 'encouraging' | 'neutral' | 'competitive'

  const SessionConfig({
    required this.questionsPerSession,
    required this.timerSeconds,
    required this.xpMultiplier,
    required this.makutaPerCorrect,
    required this.showRanking,
    required this.showStreakPressure,
    required this.showStatisticsDetail,
    required this.feedbackStyle,
  });
}

const Map<AgeMode, SessionConfig> kSessionConfigs = {
  AgeMode.child: SessionConfig(
    questionsPerSession: 3,
    timerSeconds: 10,
    xpMultiplier: 1.3,
    makutaPerCorrect: 15,
    showRanking: false,
    showStreakPressure: false,
    showStatisticsDetail: false,
    feedbackStyle: 'encouraging',
  ),
  AgeMode.teen: SessionConfig(
    questionsPerSession: 7,
    timerSeconds: 7,
    xpMultiplier: 1.1,
    makutaPerCorrect: 10,
    showRanking: true,
    showStreakPressure: true,
    showStatisticsDetail: true,
    feedbackStyle: 'neutral',
  ),
  AgeMode.adult: SessionConfig(
    questionsPerSession: 12,
    timerSeconds: 5,
    xpMultiplier: 1.0,
    makutaPerCorrect: 10,
    showRanking: true,
    showStreakPressure: true,
    showStatisticsDetail: true,
    feedbackStyle: 'competitive',
  ),
};

// ─────────────────────────────────────────────────────────────────────────────
// THEME ADAPTATIVO
// ─────────────────────────────────────────────────────────────────────────────

class AdaptiveThemeData {
  final Color primary;
  final Color accent;
  final Color background;
  final Color surface;
  final Color onBackground;
  final double buttonHeight;
  final double fontScaleFactor;
  final bool showCharacterGuide;
  final bool enableRichAnimations;
  final BorderRadius cardRadius;

  const AdaptiveThemeData({
    required this.primary,
    required this.accent,
    required this.background,
    required this.surface,
    required this.onBackground,
    required this.buttonHeight,
    required this.fontScaleFactor,
    required this.showCharacterGuide,
    required this.enableRichAnimations,
    required this.cardRadius,
  });
}

AdaptiveThemeData getAdaptiveTheme(AgeMode mode) {
  switch (mode) {
    case AgeMode.child:
      return const AdaptiveThemeData(
        primary: Color(0xFFFF6B35), // laranja vibrante
        accent: Color(0xFFFFD166), // amarelo caloroso
        background: Color(0xFFFFF8F0), // creme suave (não cansa os olhos)
        surface: Color(0xFFFFFFFF),
        onBackground: Color(0xFF2D1B00),
        buttonHeight: 64.0, // botões grandes para dedos pequenos
        fontScaleFactor: 1.2, // texto maior
        showCharacterGuide: true, // personagem animado de guia
        enableRichAnimations: true, // confetti, bounce, etc.
        cardRadius: BorderRadius.all(Radius.circular(20.0)),
      );
    case AgeMode.teen:
      return const AdaptiveThemeData(
        primary: Color(0xFF5C6BC0), // índigo
        accent: Color(0xFFFF8A65), // coral
        background: Color(0xFF1A1A2E), // dark
        surface: Color(0xFF16213E),
        onBackground: Color(0xFFE0E0E0),
        buttonHeight: 56.0,
        fontScaleFactor: 1.05,
        showCharacterGuide: false,
        enableRichAnimations: true,
        cardRadius: BorderRadius.all(Radius.circular(12.0)),
      );
    case AgeMode.adult:
      return const AdaptiveThemeData(
        primary: Color(0xFF1A3A5C), // azul profundo angolano
        accent: Color(0xFFE05C2A), // laranja accent (bandeira)
        background: Color(0xFF0F1520), // dark elegante
        surface: Color(0xFF141C2A),
        onBackground: Color(0xFFC8D8E8),
        buttonHeight: 48.0,
        fontScaleFactor: 1.0,
        showCharacterGuide: false,
        enableRichAnimations: false, // minimalista, sem distracções
        cardRadius: BorderRadius.all(Radius.circular(8.0)),
      );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// RIVERPOD PROVIDERS
// ─────────────────────────────────────────────────────────────────────────────

// Provider do modo actual (persiste em secure storage)
final ageModeProvider = StateNotifierProvider<AgeModeNotifier, AgeMode>((ref) {
  return AgeModeNotifier(ref.watch(secureStorageProvider));
});

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

class AgeModeNotifier extends StateNotifier<AgeMode> {
  final FlutterSecureStorage _storage;

  AgeModeNotifier(this._storage) : super(AgeMode.adult) {
    _loadFromStorage();
  }

  Future<void> _loadFromStorage() async {
    final saved = await _storage.read(key: 'age_mode');
    if (saved != null) {
      state = AgeMode.values.firstWhere(
        (m) => m.name == saved,
        orElse: () => AgeMode.adult,
      );
    }
  }

  Future<void> setMode(AgeMode mode) async {
    state = mode;
    await _storage.write(key: 'age_mode', value: mode.name);
  }
}

// Provider do tema derivado do modo
final adaptiveThemeProvider = Provider<AdaptiveThemeData>((ref) {
  final mode = ref.watch(ageModeProvider);
  return getAdaptiveTheme(mode);
});

// Provider da config de sessão
final sessionConfigProvider = Provider<SessionConfig>((ref) {
  final mode = ref.watch(ageModeProvider);
  return kSessionConfigs[mode]!;
});

// ─────────────────────────────────────────────────────────────────────────────
// AGE SELECTION PAGE (Onboarding Step 2)
// ─────────────────────────────────────────────────────────────────────────────

class AgeSelectionPage extends ConsumerWidget {
  final VoidCallback onSelected;

  const AgeSelectionPage({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0A0E14),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Para quem é\nesta conta?',
                style: theme.textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Vamos personalizar a tua experiência.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white54,
                ),
              ),
              const SizedBox(height: 40),

              // Cards de selecção
              _AgeCard(
                mode: AgeMode.child,
                subtitle: '6–12 anos',
                description:
                    'Sessões curtas, jogos divertidos e recompensas coloridas!',
                color: const Color(0xFFFF6B35),
                features: [
                  '3 perguntas por sessão',
                  'Mais tempo para responder',
                  'Aventura no mapa de Angola',
                ],
                onTap: () async {
                  await ref
                      .read(ageModeProvider.notifier)
                      .setMode(AgeMode.child);
                  onSelected();
                },
              ),
              const SizedBox(height: 16),
              _AgeCard(
                mode: AgeMode.teen,
                subtitle: '13–17 anos',
                description:
                    'Desafio moderado, ranking e estatísticas detalhadas.',
                color: const Color(0xFF5C6BC0),
                features: [
                  '7 perguntas por sessão',
                  'Ranking competitivo',
                  'Estatísticas de progresso',
                ],
                onTap: () async {
                  await ref
                      .read(ageModeProvider.notifier)
                      .setMode(AgeMode.teen);
                  onSelected();
                },
              ),
              const SizedBox(height: 16),
              _AgeCard(
                mode: AgeMode.adult,
                subtitle: '18+ anos',
                description:
                    'Sessões completas, análise profunda e ranking nacional.',
                color: const Color(0xFF1A3A5C),
                features: [
                  '12 perguntas por sessão',
                  'Timer de 5 segundos',
                  'Ranking provincial e nacional',
                ],
                onTap: () async {
                  await ref
                      .read(ageModeProvider.notifier)
                      .setMode(AgeMode.adult);
                  onSelected();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AgeCard extends StatelessWidget {
  final AgeMode mode;
  final String subtitle;
  final String description;
  final Color color;
  final List<String> features;
  final VoidCallback onTap;

  const _AgeCard({
    required this.mode,
    required this.subtitle,
    required this.description,
    required this.color,
    required this.features,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF141C2A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            // Emoji + cor
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(mode.emoji, style: const TextStyle(fontSize: 28)),
              ),
            ),
            const SizedBox(width: 16),
            // Conteúdo
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        mode.displayName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          subtitle,
                          style: TextStyle(
                            color: color,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: features
                        .map(
                          (f) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E2D45),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              f,
                              style: const TextStyle(
                                color: Colors.white38,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.chevron_right_rounded, color: color, size: 20),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// ADAPTIVE QUIZ TIMER WIDGET
// ─────────────────────────────────────────────────────────────────────────────

/// Timer visual que se adapta ao modo (criança = divertido, adulto = minimalista)
class AdaptiveTimerWidget extends ConsumerStatefulWidget {
  final int totalSeconds;
  final VoidCallback onTimeUp;

  const AdaptiveTimerWidget({
    super.key,
    required this.totalSeconds,
    required this.onTimeUp,
  });

  @override
  ConsumerState<AdaptiveTimerWidget> createState() =>
      _AdaptiveTimerWidgetState();
}

class _AdaptiveTimerWidgetState extends ConsumerState<AdaptiveTimerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late int _remaining;

  @override
  void initState() {
    super.initState();
    _remaining = widget.totalSeconds;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.totalSeconds),
    );
    _controller.addListener(() {
      final newRemaining = ((1 - _controller.value) * widget.totalSeconds)
          .ceil();
      if (newRemaining != _remaining) {
        setState(() => _remaining = newRemaining);
        if (_remaining == 0) widget.onTimeUp();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mode = ref.watch(ageModeProvider);
    final theme = ref.watch(adaptiveThemeProvider);
    final progress = 1 - _controller.value;
    final isUrgent = _remaining <= 3;

    if (mode == AgeMode.child) {
      // Modo criança: emoji + número grande + barra colorida
      return Column(
        children: [
          Text(isUrgent ? '⚡' : '⏱️', style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 4),
          Text(
            '$_remaining',
            style: TextStyle(
              color: isUrgent ? const Color(0xFFE05C2A) : Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: const Color(0xFF1E2D45),
              color: isUrgent ? const Color(0xFFE04444) : theme.accent,
              minHeight: 8,
            ),
          ),
        ],
      );
    } else {
      // Modo adulto/teen: círculo minimalista
      return SizedBox(
        width: 48,
        height: 48,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: progress,
              backgroundColor: const Color(0xFF1E2D45),
              color: isUrgent ? const Color(0xFFE04444) : theme.primary,
              strokeWidth: 3,
            ),
            Text(
              '$_remaining',
              style: TextStyle(
                color: isUrgent ? const Color(0xFFE04444) : Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// ADAPTIVE FEEDBACK WIDGET (após resposta)
// ─────────────────────────────────────────────────────────────────────────────

class AdaptiveFeedbackWidget extends ConsumerWidget {
  final bool isCorrect;
  final int xpGained;
  final String? explanation;
  final String? culturalNote;

  const AdaptiveFeedbackWidget({
    super.key,
    required this.isCorrect,
    required this.xpGained,
    this.explanation,
    this.culturalNote,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(ageModeProvider);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isCorrect ? const Color(0xFF0D2B1A) : const Color(0xFF2B0D0D),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isCorrect
              ? const Color(0xFF2EC99C).withValues(alpha: 0.3)
              : const Color(0xFFE04444).withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Emoji + texto adaptativo
          Row(
            children: [
              Text(
                isCorrect
                    ? (mode == AgeMode.child ? '🎉' : '✓')
                    : (mode == AgeMode.child ? '💪' : '✗'),
                style: TextStyle(fontSize: mode == AgeMode.child ? 32 : 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  isCorrect ? _correctMessage(mode) : _wrongMessage(mode),
                  style: TextStyle(
                    color: isCorrect
                        ? const Color(0xFF2EC99C)
                        : const Color(0xFFE04444),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // XP badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isCorrect
                      ? const Color(0xFF2EC99C).withValues(alpha: 0.15)
                      : const Color(0xFF1E2D45),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  isCorrect ? '+$xpGained XP' : '0 XP',
                  style: TextStyle(
                    color: isCorrect ? const Color(0xFF2EC99C) : Colors.white38,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          // Explicação (sempre mostrar)
          if (explanation != null) ...[
            const SizedBox(height: 12),
            Text(
              explanation!,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],

          // Nota cultural (só adultos e teens)
          if (culturalNote != null && mode != AgeMode.child) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('🏺 ', style: TextStyle(fontSize: 14)),
                Expanded(
                  child: Text(
                    culturalNote!,
                    style: const TextStyle(
                      color: Colors.white38,
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  String _correctMessage(AgeMode mode) {
    switch (mode) {
      case AgeMode.child:
        return 'Parabéns! Acertaste! 🌟';
      case AgeMode.teen:
        return 'Correcto!';
      case AgeMode.adult:
        return 'Correcto';
    }
  }

  String _wrongMessage(AgeMode mode) {
    switch (mode) {
      case AgeMode.child:
        return 'Quase lá! Vamos tentar mais!';
      case AgeMode.teen:
        return 'Não era essa. Tenta lembrar!';
      case AgeMode.adult:
        return 'Incorrecto';
    }
  }
}
