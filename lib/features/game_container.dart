import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'games/models/game.dart';
import 'games/services/game_service.dart';
import 'games/widgets/game_card.dart';

class GameContainer extends StatelessWidget {
  final GameService gameService;
  const GameContainer({super.key, required this.gameService});

  @override
  Widget build(BuildContext context) {
    final games = gameService.getAllGames();

    if (games.isEmpty) {
      return const Center(child: Text('Нет добавленных игр'));
    }

    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) {
        final game = games[index];
        return GestureDetector(
          onTap: () => context.push('/detail/${game.id}'),
          child: GameCard(game: game),
        );
      },
    );
  }
}
