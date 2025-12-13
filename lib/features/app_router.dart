import 'package:go_router/go_router.dart';
import 'games/screens/game_list_screen.dart';
import 'games/screens/add_edit_game_screen.dart';
import 'games/screens/game_detail_screen.dart';
import 'games/screens/stats_screen.dart';
import 'games/screens/settings_screen.dart';
import 'games/screens/completed_games_screen.dart';
import 'account/account_screen.dart';
import 'notes/games_notes_screen.dart';
import 'activity/activity_log_screen.dart';
import 'articles/articles_screen.dart';
import 'support/support_screen.dart';
import 'backup/backup_screen.dart';

GoRouter buildRouter() {
  return GoRouter(
    initialLocation: '/account',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const GameListScreen(),
      ),

      GoRoute(
        path: '/account',
        builder: (context, state) => const AccountScreen(),
      ),

      GoRoute(
        path: '/notes',
        builder: (context, state) => const GamesNotesScreen(),
      ),

      GoRoute(
        path: '/activity',
        builder: (context, state) => const ActivityLogScreen(),
      ),

      GoRoute(
        path: '/articles',
        builder: (context, state) => const ArticlesScreen(),
      ),

      GoRoute(
        path: '/support',
        builder: (context, state) => const SupportScreen(),
      ),

      GoRoute(
        path: '/backup',
        builder: (context, state) => const BackupScreen(),
      ),

      GoRoute(
        path: '/add',
        builder: (context, state) => const AddEditGameScreen(),
      ),

      GoRoute(
        path: '/detail/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return GameDetailScreen(id: id);
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
