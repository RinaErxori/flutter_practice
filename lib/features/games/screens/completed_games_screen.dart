import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../services/game_service.dart';

class CompletedGamesScreen extends StatefulWidget {
  const CompletedGamesScreen({super.key});

  @override
  State<CompletedGamesScreen> createState() => _CompletedGamesScreenState();
}

class _CompletedGamesScreenState extends State<CompletedGamesScreen> {
  @override
  Widget build(BuildContext context) {
    final repo = GetIt.I<GameService>();

    final completed = repo.games
        .where((g) => g.status == 'Completed')
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Завершённые игры'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),

      body: ListView.builder(
        itemCount: completed.length,
        itemBuilder: (context, index) {
          final game = completed[index];

          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: Image.network(
                game.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              title: Text(game.title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${game.genre} — ${game.status}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  repo.deleteGame(game.id);
                  setState(() {});
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
