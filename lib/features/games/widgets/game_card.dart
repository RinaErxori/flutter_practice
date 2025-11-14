import 'package:flutter/material.dart';
import '../models/game.dart';

class GameCard extends StatelessWidget {
  final Game game;
  const GameCard({super.key, required this.game});

  Color _statusColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'Playing':
        return Colors.blue;
      case 'Planned':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

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
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(game.genre),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _statusColor(game.status).withOpacity(0.2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                game.status,
                style: TextStyle(
                  color: _statusColor(game.status),
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        trailing: Text('⭐ ${game.rating.toStringAsFixed(1)}'),
      ),
    );
  }
}
