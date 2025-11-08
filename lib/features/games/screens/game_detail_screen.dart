import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/game.dart';
import '../services/game_service.dart';

class GameDetailScreen extends StatefulWidget {
  final Game? game;
  final GameService? gameService;
  const GameDetailScreen({super.key, required this.game, this.gameService});

  @override
  State<GameDetailScreen> createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  late Game? _game;

  @override
  void initState() {
    super.initState();
    _game = widget.game;
  }

  void _toggleStatus() {
    if (_game == null || widget.gameService == null) return;
    widget.gameService!.toggleStatus(_game!.id);
    setState(() {
      _game = widget.gameService!.getById(_game!.id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Статус изменён на "${_game!.status}"')),
    );
  }

  void _deleteGame() {
    if (_game == null || widget.gameService == null) return;
    widget.gameService!.deleteGame(_game!.id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Игра "${_game!.title}" удалена')),
    );
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    if (_game == null) {
      return const Scaffold(
        body: Center(child: Text('Ошибка: игра не найдена')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_game!.title),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Удалить игру',
            onPressed: _deleteGame,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                _game!.imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            Text(
              _game!.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Chip(
                  label: Text(_game!.genre),
                  backgroundColor: Colors.indigo.shade100,
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text(_game!.status),
                  backgroundColor: Colors.green.shade100,
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 28),
                const SizedBox(width: 4),
                Text(
                  _game!.rating.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.comment, color: Colors.indigo),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _game!.comment.isEmpty
                          ? 'Комментарий отсутствует'
                          : _game!.comment,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton.icon(
              onPressed: _toggleStatus,
              icon: const Icon(Icons.refresh),
              label: const Text('Изменить статус'),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () => context.push('/stats'),
              icon: const Icon(Icons.bar_chart),
              label: const Text('Перейти к статистике'),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}
