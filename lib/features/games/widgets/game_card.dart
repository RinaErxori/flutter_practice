import 'package:flutter/material.dart';
import '../models/game.dart';

class GameCard extends StatelessWidget {
  final Game game;
  const GameCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Image.network(
          game.imageUrl,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        title: Text(game.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${game.genre} — ${game.status}'),
        trailing: Text('⭐ ${game.rating.toStringAsFixed(1)}'),
      ),
    );
  }
}
