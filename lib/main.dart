import 'package:flutter/material.dart';
import "package:get_it/get_it.dart";
import 'features/games/services/game_service.dart';
import 'features/app_router.dart';

void main() {
  GetIt.I.registerSingleton<GameService>(GameService());

  runApp(const GameTracker());
}

class GameTracker extends StatelessWidget {
  const GameTracker({super.key});

  @override
  Widget build(BuildContext context) {
    final router = buildRouter();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Games',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      routerConfig: router,
    );
  }
}
