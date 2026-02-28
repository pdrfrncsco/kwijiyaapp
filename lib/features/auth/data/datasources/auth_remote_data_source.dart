import '../../../../core/network/api_client.dart';
import '../../domain/entities/user.dart';

class AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSource(this._apiClient);

  Future<void> requestOtp(String email) async {
    try {
      await _apiClient.dio.post('/auth/request-otp/', data: {'email': email});
    } catch (e) {
      throw Exception('Failed to request OTP: $e');
    }
  }

  Future<Map<String, dynamic>> verifyOtp(String email, String otpCode) async {
    try {
      final response = await _apiClient.dio.post(
        '/auth/verify-otp/',
        data: {'email': email, 'otp_code': otpCode},
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to verify OTP: $e');
    }
  }

  Future<Map<String, dynamic>> guestLogin() async {
    try {
      final response = await _apiClient.dio.post('/auth/guest/');
      return response.data;
    } catch (e) {
      throw Exception('Failed to login as guest: $e');
    }
  }

  Future<User> getUserProfile() async {
    try {
      final response = await _apiClient.dio.get('/users/profile/');
      return User.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get user profile: $e');
    }
  }
}
