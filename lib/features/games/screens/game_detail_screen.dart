import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/game.dart';
import '../services/game_scope.dart';

class GameDetailScreen extends StatefulWidget {
  final Game? game;

  const GameDetailScreen({super.key, required this.game});

  @override
  State<GameDetailScreen> createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  late Game? game;

  @override
  void initState() {
    super.initState();
    game = widget.game;
  }

  void _toggleStatus() {
    if (game == null) return;

    final scope = GameScope.read(context);
    final repo = scope.repository;

    repo.toggleStatus(game!.id);

    scope.state.notify();

    setState(() {
      game = repo.getById(game!.id);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Статус изменён на "${game!.status}"')),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (game == null) {
      return const Scaffold(
        body: Center(child: Text('Игра не найдена')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(game!.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go("/"),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                game!.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              game!.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Chip(label: Text(game!.status)),

            const SizedBox(height: 16),

            Text('Жанр: ${game!.genre}', style: const TextStyle(fontSize: 18)),

            const SizedBox(height: 16),

            ElevatedButton.icon(
              onPressed: _toggleStatus,
              icon: const Icon(Icons.refresh),
              label: const Text('Сменить статус'),
            ),
          ],
        ),
      ),
    );
  }
}
