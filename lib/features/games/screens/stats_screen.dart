import 'package:flutter/material.dart';
import 'settings_screen.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StatsScreen (Экран 4)')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Статистика игр'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsScreen()),
                );
              },
              child: const Text('Настройки (горизонтально)'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Назад (вертикально)'),
            ),
          ],
        ),
      ),
    );
  }
}
