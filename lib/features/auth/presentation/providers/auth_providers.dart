import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/providers/core_providers.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/entities/user.dart';

part 'auth_providers.g.dart';

@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuthRemoteDataSource(apiClient);
}

@riverpod
AuthRepository authRepository(Ref ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final tokenManager = ref.watch(tokenManagerProvider);
  return AuthRepositoryImpl(remoteDataSource, tokenManager);
}

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  FutureOr<User?> build() async {
    return _checkAuth();
  }

  Future<User?> _checkAuth() async {
    final repository = ref.read(authRepositoryProvider);
    final isLoggedIn = await repository.isLoggedIn();
    if (isLoggedIn) {
      final result = await repository.getUserProfile();
      return result.fold((l) => null, (r) {
        debugPrint(
          'AuthController loaded user id=${r.id} streakDays=${r.streakDays}',
        );
        return r;
      });
    }
    return null;
  }

  Future<void> requestOtp(String email) async {
    final repository = ref.read(authRepositoryProvider);
    state = const AsyncValue.loading();
    final result = await repository.requestOtp(email);
    result.fold(
      (l) => state = AsyncValue.error(l, StackTrace.current),
      (r) => state = const AsyncValue.data(null), // OTP sent, user still null
    );
  }

  Future<void> verifyOtp(String email, String otpCode) async {
    final repository = ref.read(authRepositoryProvider);
    state = const AsyncValue.loading();
    final result = await repository.verifyOtp(email, otpCode);
    state = result.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }

  Future<void> guestLogin() async {
    final repository = ref.read(authRepositoryProvider);
    state = const AsyncValue.loading();
    final result = await repository.guestLogin();
    state = result.fold(
      (l) => AsyncValue.error(l, StackTrace.current),
      (r) => AsyncValue.data(r),
    );
  }

  Future<void> logout() async {
    final repository = ref.read(authRepositoryProvider);
    await repository.logout();
    state = const AsyncValue.data(null);
  }
}
