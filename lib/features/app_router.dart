import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'games/services/game_scope.dart';
import 'games/screens/game_list_screen.dart';
import 'games/screens/add_edit_game_screen.dart';
import 'games/screens/game_detail_screen.dart';
import 'games/screens/stats_screen.dart';
import 'games/screens/settings_screen.dart';
import 'games/screens/completed_games_screen.dart';


GoRouter buildRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const GameListScreen(),
      ),
      GoRoute(
        path: '/add',
        builder: (context, state) => const AddEditGameScreen(),
      ),
      GoRoute(
        path: '/detail/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final game = GameScope.read(context).repository.getById(id);
          return GameDetailScreen(game: game);
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
      GoRoute(
        path: '/completed',
        builder: (context, state) => const CompletedGamesScreen(),
      ),
    ],
  );
}
