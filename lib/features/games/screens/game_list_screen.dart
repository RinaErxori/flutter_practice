import 'package:flutter/material.dart';
import '../../game_container.dart';
import '../services/game_service.dart';
import 'add_edit_game_screen.dart';
import 'stats_screen.dart';
import 'settings_screen.dart';

class GameListScreen extends StatelessWidget {
  final GameService gameService;
  const GameListScreen({super.key, required this.gameService});

  // Безопасная замена экрана: выполняем pushReplacement ПОСЛЕ кадра
  void _replaceAfterFrame(BuildContext context, Widget page) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context, rootNavigator: true).pushReplacement(
        MaterialPageRoute(builder: (_) => page),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    void _addGame() {
      // Вертикальный переход — обычный push
      Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(
          builder: (_) => AddEditGameScreen(gameService: gameService),
        ),
      );
    }

    void _goToStats() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Открываю статистику...')),
      );
      _replaceAfterFrame(context, const StatsScreen());
    }

    void _goToSettings() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Открываю настройки...')),
      );
      _replaceAfterFrame(context, const SettingsScreen());
    }

    return Scaffold(
      appBar: AppBar(title: const Text('GameListScreen (Экран 1)')),
      body: GameContainer(gameService: gameService),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: _addGame,
            label: const Text('Новая игра'),
            icon: const Icon(Icons.add),
          ),
          const SizedBox(height: 12),
          FloatingActionButton.extended(
            onPressed: _goToStats,
            label: const Text('Статистика (горизонтально)'),
            icon: const Icon(Icons.bar_chart),
          ),
          const SizedBox(height: 12),
          FloatingActionButton.extended(
            onPressed: _goToSettings,
            label: const Text('Настройки (горизонтально)'),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
