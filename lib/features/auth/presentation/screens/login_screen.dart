import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/auth_providers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();
  bool _isOtpSent = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  void _showError(String message) {
    if (!mounted) return;
    setState(() {
      _isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.error),
    );
  }

  Future<void> _handleRequestOtp() async {
    final email = _emailController.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      _showError('Por favor, insira um email válido.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await ref.read(authControllerProvider.notifier).requestOtp(email);
      if (mounted) {
        setState(() {
          _isOtpSent = true;
          _isLoading = false;
        });
      }
    } catch (e) {
      _showError('Erro ao enviar código: $e');
    }
  }

  Future<void> _handleVerifyOtp() async {
    final email = _emailController.text.trim();
    final otp = _otpController.text.trim();
    if (otp.length != 6) {
      _showError('O código deve ter 6 dígitos.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await ref.read(authControllerProvider.notifier).verifyOtp(email, otp);
      // Navigation is handled by listener
    } catch (e) {
      _showError('Erro ao verificar código: $e');
    }
  }

  Future<void> _handleGuestLogin() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await ref.read(authControllerProvider.notifier).guestLogin();
      // Navigation is handled by listener
    } catch (e) {
      _showError('Erro ao entrar como visitante: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Listen for auth state changes
    ref.listen(authControllerProvider, (previous, next) {
      next.whenOrNull(
        data: (user) {
          if (user != null) {
            if (user.dateOfBirth == null && !user.isGuest) {
              // New user or incomplete profile (skip for guests)
              context.go('/profile-setup');
            } else if (user.placementTestCompleted) {
              // User already completed placement test, go to language selection
              context.go('/languages');
            } else {
              // New user, go to placement test
              context.go('/placement-test');
            }
          }
        },
        error: (e, st) {
          _showError(e.toString());
        },
      );
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.school, // Use custom logo later
                  size: 80,
                  color: AppColors.primary,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Kwijiya',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Aprenda jogando as línguas nacionais de Angola',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 48),
                if (!_isOtpSent) ...[
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _isLoading ? null : () => _handleRequestOtp(),
                    child: _isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Receber Código'),
                  ),
                ] else ...[
                  Text(
                    'Código enviado para ${_emailController.text}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    decoration: const InputDecoration(
                      labelText: 'Código de 6 dígitos',
                      prefixIcon: Icon(Icons.lock_outline),
                      counterText: '',
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _isLoading ? null : () => _handleVerifyOtp(),
                    child: _isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Entrar'),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isOtpSent = false;
                        _otpController.clear();
                      });
                    },
                    child: const Text('Usar outro email'),
                  ),
                ],
                const SizedBox(height: 32),
                const Divider(),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: _isLoading ? null : () => _handleGuestLogin(),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(color: AppColors.primary),
                  ),
                  child: const Text('Entrar como Visitante'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
