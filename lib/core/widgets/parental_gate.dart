import 'dart:math';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ParentalGate {
  static void verify(BuildContext context, VoidCallback onVerified) {
    final random = Random();
    final num1 = random.nextInt(10) + 10; // 10-19
    final num2 = random.nextInt(10) + 1; // 1-10
    final answer = num1 * num2;
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Controle Parental'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Para continuar, resolva este problema:'),
            const SizedBox(height: 16),
            Text(
              '$num1 x $num2 = ?',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Resposta',
              ),
              onSubmitted: (_) {
                _checkAnswer(context, controller, answer, onVerified);
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () =>
                _checkAnswer(context, controller, answer, onVerified),
            child: const Text('Verificar'),
          ),
        ],
      ),
    );
  }

  static void _checkAnswer(
    BuildContext context,
    TextEditingController controller,
    int answer,
    VoidCallback onVerified,
  ) {
    final input = int.tryParse(controller.text);
    if (input == answer) {
      Navigator.of(context).pop(); // Close dialog
      onVerified();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Resposta incorreta. Tente novamente.'),
          backgroundColor: AppColors.error,
        ),
      );
      controller.clear();
      // Optionally regenerate problem, but for simplicity just clear
    }
  }
}
