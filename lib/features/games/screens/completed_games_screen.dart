import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../stores/completed_games/completed_games_store.dart';

class CompletedGamesScreen extends StatelessWidget {
  const CompletedGamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I<CompletedGamesStore>();
    store.load();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Завершённые игры'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go("/"),
          )
      ),

      body: Observer(
        builder: (_) {
          final list = store.completed;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, i) {
              final game = list[i];

              return Card(
                child: ListTile(
                  leading: Image.network(game.imageUrl),
                  title: Text(game.title),
                  subtitle: Text(game.genre),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => store.delete(game.id),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
