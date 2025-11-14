import 'package:flutter/material.dart';
import 'features/games/services/game_scope.dart';
import 'features/app_router.dart';

void main() {
  runApp(
    const GameScope(
      child: GameTracker(),
    ),
  );
}

class GameTracker extends StatelessWidget {
  const GameTracker({super.key});

  @override
  Widget build(BuildContext context) {
    final router = buildRouter();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Game Tracker',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      routerConfig: router,
    );
  }
}
