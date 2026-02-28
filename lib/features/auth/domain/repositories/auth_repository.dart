import 'package:fpdart/fpdart.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Exception, void>> requestOtp(String email);
  Future<Either<Exception, User>> verifyOtp(String email, String otpCode);
  Future<Either<Exception, User>> guestLogin();
  Future<Either<Exception, User>> getUserProfile();
  Future<void> logout();
  Future<bool> isLoggedIn();
}
