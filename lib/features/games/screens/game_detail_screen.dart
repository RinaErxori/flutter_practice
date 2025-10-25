import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/game.dart';

class GameDetailScreen extends StatelessWidget {
  final Game game;
  const GameDetailScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(game.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (game.imageUrl != null && game.imageUrl!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: game.imageUrl!,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16),
            Text('Жанр: ${game.genre}'),
            Text('Статус: ${game.status}'),
            if (game.rating != null)
              Text('Рейтинг: ${game.rating!.toStringAsFixed(1)}'),
            if (game.comment != null && game.comment!.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text('Комментарий: ${game.comment!}'),
            ],
          ],
        ),
      ),
    );
  }
}
