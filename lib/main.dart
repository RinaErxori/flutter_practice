import 'package:flutter/material.dart';
import 'features/games/services/game_service.dart';
import 'features/app_router.dart';

void main() {
  final gameService = GameService();
  runApp(GameTracker(gameService: gameService));
}

class GameTracker extends StatelessWidget {
  final GameService gameService;
  const GameTracker({super.key, required this.gameService});

  @override
  Widget build(BuildContext context) {
    final router = buildRouter(gameService);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Games',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      routerConfig: router,
    );
  }
}