import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/game_scope.dart';
import '../widgets/game_card.dart';
import '../models/game.dart';

class GameListScreen extends StatefulWidget {
  const GameListScreen({super.key});

  @override
  State<GameListScreen> createState() => _GameListScreenState();
}

class _GameListScreenState extends State<GameListScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<Game> _filteredGames() {
    final query = _searchController.text.toLowerCase();
    final repo = GameScope.of(context).repository;

    return repo.games
        .where((g) => g.title.toLowerCase().contains(query))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final games = _filteredGames();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Игры"),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Поиск по названию...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: games.length,
              itemBuilder: (context, index) {
                final game = games[index];
                return GestureDetector(
                  onTap: () => context.push('/detail/${game.id}'),
                  child: GameCard(game: game),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () => context.go('/completed'),
            icon: const Icon(Icons.done),
            label: const Text('Завершённые'),
          ),
          const SizedBox(height: 12),

          FloatingActionButton.extended(
            onPressed: () => context.go('/add'),
            icon: const Icon(Icons.add),
            label: const Text('Добавить'),
          ),
          const SizedBox(height: 12),

          FloatingActionButton.extended(
            onPressed: () => context.go('/stats'),
            icon: const Icon(Icons.bar_chart),
            label: const Text('Статистика'),
          ),
          const SizedBox(height: 12),

          FloatingActionButton.extended(
            onPressed: () => context.go('/settings'),
            icon: const Icon(Icons.settings),
            label: const Text('Настройки'),
          ),
        ],
      ),
    );
  }
}
