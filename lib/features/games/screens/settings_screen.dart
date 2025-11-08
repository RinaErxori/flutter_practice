import 'package:flutter/material.dart';
import 'game_list_screen.dart';
import '../services/game_service.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _replaceAfterFrame(BuildContext context, Widget page) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context, rootNavigator: true).pushReplacement(
        MaterialPageRoute(builder: (_) => page),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final gameService = GameService();

    return Scaffold(
      appBar: AppBar(title: const Text('SettingsScreen (Экран 5)')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Возврат на главный экран...')),
            );
            _replaceAfterFrame(
              context,
              GameListScreen(gameService: gameService),
            );
          },
          icon: const Icon(Icons.arrow_back),
          label: const Text('Вернуться на главный экран'),
        ),
      ),
    );
  }
}
