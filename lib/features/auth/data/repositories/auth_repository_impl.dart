import 'package:fpdart/fpdart.dart';
import '../../../../core/network/token_manager.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final TokenManager _tokenManager;

  AuthRepositoryImpl(this._remoteDataSource, this._tokenManager);

  @override
  Future<Either<Exception, void>> requestOtp(String email) async {
    try {
      await _remoteDataSource.requestOtp(email);
      return const Right(null);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, User>> verifyOtp(
    String email,
    String otpCode,
  ) async {
    try {
      final tokens = await _remoteDataSource.verifyOtp(email, otpCode);
      await _saveTokens(tokens);
      final user = await _remoteDataSource.getUserProfile();
      return Right(user);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, User>> guestLogin() async {
    try {
      final tokens = await _remoteDataSource.guestLogin();
      await _saveTokens(tokens);
      final user = await _remoteDataSource.getUserProfile();
      return Right(user);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, User>> getUserProfile() async {
    try {
      final user = await _remoteDataSource.getUserProfile();
      return Right(user);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<void> logout() async {
    await _tokenManager.clearToken();
  }

  @override
  Future<bool> isLoggedIn() async {
    return await _tokenManager.hasToken();
  }

  Future<void> _saveTokens(Map<String, dynamic> data) async {
    String? accessToken;

    // Check for nested 'tokens' object (Custom response)
    if (data.containsKey('tokens') && data['tokens'] is Map) {
      final tokens = data['tokens'] as Map<String, dynamic>;
      accessToken = tokens['access'];
    }
    // Check for direct 'access' key (Standard SimpleJWT)
    else if (data.containsKey('access')) {
      accessToken = data['access'];
    }

    if (accessToken != null) {
      await _tokenManager.saveToken(accessToken);
    }
    // TODO: Handle refresh token if needed
  }
}
