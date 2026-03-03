import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/profile_setup_screen.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/languages/presentation/screens/language_selection_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/quiz/presentation/screens/quiz_screen.dart';
import '../../features/quiz/presentation/screens/placement_test_screen.dart';
import '../../features/rankings/presentation/screens/ranking_screen.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter goRouter(Ref ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/profile-setup',
        builder: (context, state) => const ProfileSetupScreen(),
      ),
      GoRoute(
        path: '/languages',
        builder: (context, state) => const LanguageSelectionScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/ranking',
        builder: (context, state) => const RankingScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/placement-test',
        builder: (context, state) => const PlacementTestScreen(),
      ),
      GoRoute(
        path: '/quiz/:languageCode/:level',
        builder: (context, state) {
          final languageCode = state.pathParameters['languageCode']!;
          final level = int.parse(state.pathParameters['level']!);
          return QuizScreen(languageCode: languageCode, level: level);
        },
      ),
    ],
  );
}
