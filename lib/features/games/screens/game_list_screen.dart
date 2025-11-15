import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/game_list/game_list_store.dart';
import '../widgets/game_card.dart';
import 'package:go_router/go_router.dart';

class GameListScreen extends StatelessWidget {
  const GameListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I<GameListStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Игры'),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            tooltip: "Завершённые игры",
            onPressed: () => context.go('/completed'),
          ),
          IconButton(
            icon: const Icon(Icons.equalizer),
            tooltip: "Статистика",
            onPressed: () => context.go("/stats"),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: "Настройки",
            onPressed: () => context.go('/settings'),
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Поиск...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: store.setSearch,
            ),
          ),

          Expanded(
            child: Observer(
              builder: (_) {
                final games = store.filtered;

                return ListView.builder(
                  itemCount: games.length,
                  itemBuilder: (context, index) {
                    final game = games[index];
                    return GestureDetector(
                      onTap: () => context.go('/detail/${game.id}'),
                      child: GameCard(game: game),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/add'),
        tooltip: "Добавить игру",
        child: const Icon(Icons.add),
      ),
    );
  }
}
