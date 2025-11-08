import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'games/services/game_service.dart';
import 'games/screens/game_list_screen.dart';
import 'games/screens/add_edit_game_screen.dart';
import 'games/screens/game_detail_screen.dart';
import 'games/screens/stats_screen.dart';
import 'games/screens/settings_screen.dart';

GoRouter buildRouter(GameService gameService) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => GameListScreen(gameService: gameService),
      ),
      GoRoute(
        path: '/add',
        builder: (context, state) => AddEditGameScreen(gameService: gameService),
      ),
      GoRoute(
        path: '/detail/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final game = gameService.getById(id);
          return GameDetailScreen(
            game: game,
            gameService: gameService,
          );
        },
      ),
      GoRoute(
        path: '/stats',
        builder: (context, state) => const StatsScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
