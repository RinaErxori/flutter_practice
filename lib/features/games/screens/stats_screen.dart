import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../services/game_service.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = GetIt.I<GameService>();
    final games = repo.games;

    final total = games.length;
    final planned = games.where((g) => g.status == 'Planned').length;
    final playing = games.where((g) => g.status == 'Playing').length;
    final completed = games.where((g) => g.status == 'Completed').length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Статистика'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Всего игр: $total',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text('Запланировано: $planned'),
            Text('Играю: $playing'),
            Text('Пройдено: $completed'),
          ],
        ),
      ),
    );
  }
}
