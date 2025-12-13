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
      backgroundColor: const Color(0xFFF3F4F8),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => context.go('/account'),
                    icon: const Icon(Icons.arrow_back),
                    tooltip: 'К аккаунту',
                  ),
                  const Expanded(
                    child: Text(
                      'Игры',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
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
                  PopupMenuButton<String>(
                    onSelected: (path) => context.go(path),
                    itemBuilder: (_) => const [
                      PopupMenuItem(
                        value: '/activity',
                        child: Text('Журнал действий'),
                      ),
                      PopupMenuItem(
                        value: '/articles',
                        child: Text('Библиотека статей'),
                      ),
                      PopupMenuItem(
                        value: '/support',
                        child: Text('Поддержка'),
                      ),
                      PopupMenuItem(
                        value: '/backup',
                        child: Text('Бэкап'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Поиск...',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  ),
                  onChanged: store.setSearch,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Список игр',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextButton.icon(
                    onPressed: () => context.go('/add'),
                    icon: const Icon(Icons.add_circle_outline),
                    label: const Text('Добавить'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Observer(
                builder: (_) {
                  final games = store.filtered;

                  if (games.isEmpty) {
                    return const Center(child: Text('Игры не найдены'));
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
      ),
    );
  }
}
