import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../providers/auth_providers.dart';

class ProfileSetupScreen extends ConsumerStatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  ConsumerState<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends ConsumerState<ProfileSetupScreen> {
  final _dobController = TextEditingController();
  DateTime? _selectedDate;
  bool _isLoading = false;

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.error),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('pt', 'AO'),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dobController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  Future<void> _handleSave() async {
    if (_selectedDate == null) {
      _showError('Por favor, selecione sua data de nascimento.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final dobString = DateFormat('yyyy-MM-dd').format(_selectedDate!);
      await ref.read(authControllerProvider.notifier).updateProfile({
        'date_of_birth': dobString,
      });

      if (mounted) {
        // Navigate based on user state
        final user = ref.read(authControllerProvider).value;
        if (user != null) {
          if (user.placementTestCompleted) {
            context.go('/languages');
          } else {
            context.go('/placement-test');
          }
        }
      }
    } catch (e) {
      _showError('Erro ao atualizar perfil: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  String _getAgeGroupLabel() {
    if (_selectedDate == null) return '';
    final now = DateTime.now();
    int age = now.year - _selectedDate!.year;
    if (now.month < _selectedDate!.month ||
        (now.month == _selectedDate!.month && now.day < _selectedDate!.day)) {
      age--;
    }

    if (age < 13) return 'Modo Criança (Conteúdo Adaptado)';
    if (age < 18) return 'Modo Jovem';
    return 'Modo Adulto';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Completar Perfil')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.cake, size: 64, color: AppColors.primary),
            const SizedBox(height: 24),
            const Text(
              'Quando você nasceu?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Precisamos da sua data de nascimento para adaptar o conteúdo ao seu nível.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _dobController,
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: const InputDecoration(
                labelText: 'Data de Nascimento',
                suffixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            if (_selectedDate != null)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, color: AppColors.primary),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        _getAgeGroupLabel(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            const Spacer(),
            ElevatedButton(
              onPressed: _isLoading ? null : _handleSave,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
