import 'package:flutter/material.dart';
import "package:get_it/get_it.dart";
import 'features/games/services/game_service.dart';
import 'features/app_router.dart';
import 'features/games/stores/add_game/add_game_store.dart';
import 'features/games/stores/completed_games/completed_games_store.dart';
import 'features/games/stores/game_detail/game_detail_store.dart';
import 'features/games/stores/game_list/game_list_store.dart';

void main() {
  GetIt.I.registerSingleton<GameService>(GameService());
  GetIt.I.registerSingleton<AddGameStore>(AddGameStore());
  GetIt.I.registerSingleton<CompletedGamesStore>(CompletedGamesStore());
  GetIt.I.registerSingleton<GameDetailStore>(GameDetailStore());
  GetIt.I.registerSingleton<GameListStore>(GameListStore());

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
