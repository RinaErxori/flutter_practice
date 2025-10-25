import 'package:flutter/material.dart';
import '../models/game.dart';

class GameDetailScreen extends StatelessWidget {
  final Game game;
  const GameDetailScreen({required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Удалить игру'),
                  content:
                  Text('Вы уверены, что хотите удалить "${game.title}"?'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(ctx, false),
                        child: const Text('Отмена')),
                    ElevatedButton(
                        onPressed: () => Navigator.pop(ctx, true),
                        child: const Text('Удалить')),
                  ],
                ),
              );
              if (confirm == true) Navigator.pop(context, 'delete');
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Navigator.pop(context, 'edit'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(game.title, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.category, size: 18),
                const SizedBox(width: 6),
                Text(game.genre),
                const SizedBox(width: 16),
                const Icon(Icons.info_outline, size: 18),
                const SizedBox(width: 6),
                Text(game.status),
              ],
            ),
            const SizedBox(height: 12),
            if (game.rating != null)
              Text('Рейтинг: ${game.rating!.toStringAsFixed(1)}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            if (game.comment != null && game.comment!.isNotEmpty) ...[
              const Text('Комментарий:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(game.comment!),
            ],
          ],
        ),
      ),
    );
  }
}
