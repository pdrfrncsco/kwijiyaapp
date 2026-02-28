import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/api_client.dart';
import '../network/token_manager.dart';
import '../services/sound_service.dart';

part 'core_providers.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError();
}

final soundServiceProvider = ChangeNotifierProvider<SoundService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SoundService(prefs);
});

@Riverpod(keepAlive: true)
TokenManager tokenManager(Ref ref) {
  return TokenManager();
}

@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) {
  final tokenManager = ref.watch(tokenManagerProvider);
  return ApiClient(tokenManager);
}
