import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/adaptive/age_mode.dart';
import 'core/providers/core_providers.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/global_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const KwijiyaApp(),
    ),
  );
}

class KwijiyaApp extends ConsumerWidget {
  const KwijiyaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final adaptiveTheme = ref.watch(adaptiveThemeProvider);

    // Create ThemeData from AdaptiveThemeData
    final themeData = AppTheme.darkTheme.copyWith(
      primaryColor: adaptiveTheme.primary,
      scaffoldBackgroundColor: adaptiveTheme.background,
      cardColor: adaptiveTheme.surface,
      colorScheme: AppTheme.darkTheme.colorScheme.copyWith(
        primary: adaptiveTheme.primary,
        secondary: adaptiveTheme.accent,
        surface: adaptiveTheme.surface,
        onSurface: adaptiveTheme.onBackground,
      ),
      textTheme: AppTheme.darkTheme.textTheme.apply(
        fontSizeFactor: adaptiveTheme.fontScaleFactor,
        bodyColor: adaptiveTheme.onBackground,
        displayColor: adaptiveTheme.onBackground,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: adaptiveTheme.primary,
          foregroundColor: Colors.white,
          minimumSize: Size(double.infinity, adaptiveTheme.buttonHeight),
          shape: RoundedRectangleBorder(borderRadius: adaptiveTheme.cardRadius),
        ),
      ),
      cardTheme: AppTheme.darkTheme.cardTheme.copyWith(
        color: adaptiveTheme.surface,
        shape: RoundedRectangleBorder(borderRadius: adaptiveTheme.cardRadius),
      ),
    );

    return MaterialApp.router(
      title: 'Kwijiya',
      theme: themeData,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'AO'), // Portuguese (Angola)
        Locale('en', ''), // English
      ],
    );
  }
}
