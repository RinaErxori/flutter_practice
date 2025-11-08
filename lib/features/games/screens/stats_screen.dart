import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Статистика игр')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Экран статистики она скоро будет)'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/settings'),
              child: const Text('Настройки'),
            ),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('← Назад'),
            ),
          ],
        ),
      ),
    );
  }
}
