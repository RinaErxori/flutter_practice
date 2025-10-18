import './models/Game.dart';
import 'package:flutter/material.dart';
import './screens/AddEditGameScreen.dart';
import './screens/GameDetailScreen.dart';
import './widgets/GameCard.dart';

class GameContainer extends StatefulWidget {
  const GameContainer({Key? key}) : super(key: key);

  @override
  State<GameContainer> createState() => _GameContainerState();
}

class _GameContainerState extends State<GameContainer>
    with SingleTickerProviderStateMixin {
  final List<String> statuses = const ['Все', 'Хочу пройти', 'Играю', 'Пройдено'];
  late final TabController _tabs;
  final List<Game> _games = [
    Game(
      id: '1',
      title: 'Hollow Knight',
      genre: 'Metroidvania',
      status: 'Пройдено',
      rating: 9.5,
      comment: 'Атмосферно и сложно!',
    ),
    Game(
      id: '2',
      title: 'Elden Ring',
      genre: 'Action RPG',
      status: 'Играю',
    ),
    Game(
      id: '3',
      title: 'The Witcher 3',
      genre: 'RPG',
      status: 'Хочу пройти',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: statuses.length, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  List<Game> _filtered(String status) {
    if (status == 'Все') return _games;
    return _games.where((g) => g.status == status).toList();
  }

  void _delete(Game game) {
    setState(() => _games.removeWhere((g) => g.id == game.id));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Игра удалена'),
        action: SnackBarAction(
          label: 'Отменить',
          onPressed: () => setState(() => _games.add(game)),
        ),
      ),
    );
  }

  Future<void> _add() async {
    final result = await Navigator.push<Game?>(
      context,
      MaterialPageRoute(builder: (_) => AddEditGameScreen()),
    );
    if (result != null) setState(() => _games.add(result));
  }

  Future<void> _edit(Game game) async {
    final result = await Navigator.push<Game?>(
      context,
      MaterialPageRoute(builder: (_) => AddEditGameScreen(game: game)),
    );
    if (result != null) {
      setState(() {
        final i = _games.indexWhere((g) => g.id == result.id);
        if (i != -1) _games[i] = result;
      });
    }
  }

  Future<void> _detail(Game game) async {
    final action = await Navigator.push<String?>(
      context,
      MaterialPageRoute(builder: (_) => GameDetailScreen(game: game)),
    );
    if (action == 'edit') _edit(game);
    if (action == 'delete') _delete(game);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GameTracker'),
        bottom: TabBar(
          controller: _tabs,
          isScrollable: true,
          tabs: statuses.map((s) => Tab(text: s)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabs,
        children: statuses.map((status) {
          final list = _filtered(status);
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
      floatingActionButton: FloatingActionButton(
        onPressed: _add,
        tooltip: 'Добавить игру',
        child: const Icon(Icons.add),
      ),
    );
  }
}
