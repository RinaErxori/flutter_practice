import 'package:flutter/material.dart';
import '../models/game.dart';

class GameCard extends StatelessWidget {
  final Game game;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const GameCard({
    required this.game,
    required this.onTap,
    required this.onDelete,
  });

  Color _statusColor(String status) {
    switch (status) {
      case 'Пройдено':
        return Colors.green;
      case 'Играю':
        return Colors.orange;
      default:
        return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(game.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => onDelete(),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            backgroundColor: _statusColor(game.status),
            child: const Icon(Icons.videogame_asset, color: Colors.white),
          ),
          title: Text(game.title),
          subtitle: Text('${game.genre} • ${game.status}'),
          trailing: game.rating != null
              ? Text(
            game.rating!.toStringAsFixed(1),
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
              : null,
        ),
      ),
    );
  }
}
