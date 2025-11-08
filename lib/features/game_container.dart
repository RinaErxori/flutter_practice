import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pr2/features/games/screens/game_detail_screen.dart';
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => GameDetailScreen(game: game, gameService: gameService),
              ),
            );
          },
          child: GameCard(game: game),
        );
      },
    );
  }
}
