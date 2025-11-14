import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/game_scope.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = GameScope.of(context).repository;
    final games = repo.games;

    final playing = games.where((g) => g.status == 'Playing').length;
    final completed = games.where((g) => g.status == 'Completed').length;
    final planned = games.where((g) => g.status == 'Planned').length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Статистика'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go("/"),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Всего игр: ${games.length}",
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 12),
            Text("Играю: $playing"),
            Text("Завершено: $completed"),
            Text("Запланировано: $planned"),
          ],
        ),
      ),
    );
  }
}
