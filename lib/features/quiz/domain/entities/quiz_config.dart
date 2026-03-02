enum AgeGroup { child, teen, adult }

class QuizConfig {
  final AgeGroup ageGroup;
  final int timerSeconds;
  final int questionsPerSession;
  final double fontSizeMultiplier;
  final bool useEmojiFeedback;
  final int xpMultiplier;

  const QuizConfig({
    required this.ageGroup,
    required this.timerSeconds,
    required this.questionsPerSession,
    required this.fontSizeMultiplier,
    required this.useEmojiFeedback,
    required this.xpMultiplier,
  });

  factory QuizConfig.forAgeGroup(String? ageGroupStr) {
    AgeGroup group;
    switch (ageGroupStr?.toLowerCase()) {
      case 'child':
        group = AgeGroup.child;
        break;
      case 'teen':
        group = AgeGroup.teen;
        break;
      case 'adult':
      default:
        group = AgeGroup.adult;
    }

    switch (group) {
      case AgeGroup.child:
        return const QuizConfig(
          ageGroup: AgeGroup.child,
          timerSeconds: 15, // Mais tempo para crianças
          questionsPerSession: 5, // Sessões mais curtas
          fontSizeMultiplier: 1.3, // Texto maior
          useEmojiFeedback: true, // 🎉 em vez de "Correcto!"
          xpMultiplier: 2, // Mais XP para motivar
        );
      case AgeGroup.teen:
        return const QuizConfig(
          ageGroup: AgeGroup.teen,
          timerSeconds: 10,
          questionsPerSession: 8,
          fontSizeMultiplier: 1.1,
          useEmojiFeedback: true,
          xpMultiplier: 1,
        );
      case AgeGroup.adult:
        return const QuizConfig(
          ageGroup: AgeGroup.adult,
          timerSeconds: 7, // Mais pressão de tempo
          questionsPerSession: 10,
          fontSizeMultiplier: 1.0,
          useEmojiFeedback: false,
          xpMultiplier: 1,
        );
    }
  }
}
