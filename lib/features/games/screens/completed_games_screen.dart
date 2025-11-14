import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/game_scope.dart';

class CompletedGamesScreen extends StatelessWidget {
  const CompletedGamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = GameScope.of(context).repository;
    final completed = repo.games.where((g) => g.status == 'Completed').toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Завершённые игры'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go("/"),
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
              title: Text(
                game.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${game.genre} — ${game.status}'),

              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  GameScope.read(context).repository.deleteGame(game.id);

                  GameScope.read(context).state.notify();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Игра "${game.title}" удалена')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
