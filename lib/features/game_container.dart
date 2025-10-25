import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'games/models/game.dart';
import 'games/screens/add_edit_game_screen.dart';
import 'games/screens/game_detail_screen.dart';
import 'games/widgets/game_card.dart';

class GameContainer extends StatefulWidget {
  const GameContainer({super.key});

  @override
  State<GameContainer> createState() => _GameContainerState();
}

class _GameContainerState extends State<GameContainer>
    with SingleTickerProviderStateMixin {
  final statuses = ['Все', 'Хочу пройти', 'Играю', 'Пройдено'];
  late TabController _tabs;
  final List<Game> _games = [];

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: statuses.length, vsync: this);
    _ensureMinFiveGames();
    _prefetchImages();
  }

  void _ensureMinFiveGames() {
    if (_games.length >= 5) return;
    _games.addAll([
      Game(
        id: '1',
        title: 'The Witcher 3',
        genre: 'RPG',
        status: 'Пройдено',
        imageUrl:
        'https://cdn.pixabay.com/photo/2020/08/06/12/57/character-5467892_1280.jpg',
      ),
      Game(
        id: '2',
        title: 'Hades',
        genre: 'Roguelike',
        status: 'Играю',
        imageUrl:
        'https://cdn.cloudflare.steamstatic.com/steam/apps/1145360/header.jpg',
      ),
      Game(
        id: '3',
        title: 'Celeste',
        genre: 'Platformer',
        status: 'Хочу пройти',
        imageUrl:
        'https://cdn.cloudflare.steamstatic.com/steam/apps/504230/header.jpg',
      ),
      Game(
        id: '4',
        title: 'Hollow Knight',
        genre: 'Metroidvania',
        status: 'Пройдено',
        imageUrl:
        'https://cdn.cloudflare.steamstatic.com/steam/apps/367520/header.jpg',
      ),
      Game(
        id: '5',
        title: 'Portal 2',
        genre: 'Puzzle',
        status: 'Пройдено',
        imageUrl:
        'https://cdn.cloudflare.steamstatic.com/steam/apps/620/header.jpg',
      ),
    ]);
  }

  Future<void> _prefetchImages() async {
    final manager = DefaultCacheManager();
    for (final g in _games) {
      if (g.imageUrl != null) {
        try {
          await manager.downloadFile(g.imageUrl!);
        } catch (_) {}
      }
    }
  }

  List<Game> _filtered(String s) =>
      s == 'Все' ? _games : _games.where((g) => g.status == s).toList();

  void _add() async {
    final res = await Navigator.push<Game?>(
      context,
      MaterialPageRoute(builder: (_) => const AddEditGameScreen()),
    );
    if (res != null) setState(() => _games.add(res));
  }

  void _delete(Game g) => setState(() => _games.remove(g));
  void _detail(Game g) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => GameDetailScreen(game: g)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Учёт игр'),
        bottom: TabBar(
          controller: _tabs,
          isScrollable: true,
          tabs: statuses.map((s) => Tab(text: s)).toList(),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue.shade50,
            padding: const EdgeInsets.all(8),
            child: const Text(
              'Изображения кэшируются и доступны офлайн',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabs,
              children: statuses.map((s) {
                final list = _filtered(s);
                if (list.isEmpty) return const Center(child: Text('Нет игр'));
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, i) => GameCard(
                    game: list[i],
                    onTap: () => _detail(list[i]),
                    onDelete: () => _delete(list[i]),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _add,
        child: const Icon(Icons.add),
      ),
    );
  }
}
