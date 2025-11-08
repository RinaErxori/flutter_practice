import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pr2/features/game_container.dart';
import 'package:pr2/features/games/services/game_service.dart';

class GameListScreen extends StatelessWidget {
  final GameService gameService;
  const GameListScreen({super.key, required this.gameService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Список игр')),
      body: GameContainer(gameService: gameService),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () => context.push('/add'),
            label: const Text('Добавить игру'),
            icon: const Icon(Icons.add),
          ),
          const SizedBox(height: 12),
          FloatingActionButton.extended(
            onPressed: () => context.go('/stats'),
            label: const Text('Статистика'),
            icon: const Icon(Icons.bar_chart),
          ),
          const SizedBox(height: 12),
          FloatingActionButton.extended(
            onPressed: () => context.go('/settings'),
            label: const Text('Настройки'),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
