import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'games/models/game.dart';
import 'games/services/game_scope.dart';
import 'games/widgets/game_card.dart';

class GameContainer extends StatelessWidget {
  const GameContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final games = GameScope.of(context).repository.games;

    if (games.isEmpty) {
      return const Center(
        child: Text(
          'Нет игр',
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
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
