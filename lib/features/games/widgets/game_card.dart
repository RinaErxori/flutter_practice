import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/game.dart';

class GameCard extends StatelessWidget {
  final Game game;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const GameCard({
    super.key,
    required this.game,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final hasImage = game.imageUrl != null && game.imageUrl!.isNotEmpty;
    final leading = hasImage
        ? ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: game.imageUrl!,
        width: 56,
        height: 56,
        fit: BoxFit.cover,
        placeholder: (c, _) => Container(
          width: 56,
          height: 56,
          color: Colors.grey.shade200,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(strokeWidth: 2),
        ),
        errorWidget: (c, _, __) => const Icon(Icons.broken_image),
      ),
    )
        : const CircleAvatar(child: Icon(Icons.videogame_asset));

    return Card(
      child: ListTile(
        onTap: onTap,
        leading: leading,
        title: Text(game.title),
        subtitle: Text('${game.genre} • ${game.status}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
