import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import '../../models/game.dart';
import '../../services/game_service.dart';
import '../../../activity/activity_log_store.dart';
import '../../../notes/games_notes_store.dart';

part 'game_detail_store.g.dart';

class GameDetailStore = _GameDetailStore with _$GameDetailStore;

abstract class _GameDetailStore with Store {
  final service = GetIt.I<GameService>();
  final logStore = GetIt.I<ActivityLogStore>();

  @observable
  Game? game;

  @action
  void load(String id) {
    game = service.getById(id);
  }

  @action
  void toggleStatus() {
    if (game == null) return;

    service.toggleStatus(game!.id);
    game = service.getById(game!.id);
    if (game != null) {
      logStore.logAction(
        'Статус игры ${game!.title} изменён на ${game!.status}',
        category: 'games',
      );
    }
    GetIt.I<GamesNotesStore>().refreshGames();
  }

  @action
  void updateGame(Game updated) {
    service.updateGame(updated.id, updated);
    game = service.getById(updated.id);
    if (game != null) {
      logStore.logAction('Обновлена игра ${game!.title}', category: 'games');
    }
    GetIt.I<GamesNotesStore>().refreshGames();
  }

  @action
  void deleteGame() {
    if (game == null) return;
    final id = game!.id;
    final title = game!.title;
    service.deleteGame(id);
    logStore.logAction('Удалена игра $title', category: 'games');
    game = null;
    GetIt.I<GamesNotesStore>().refreshGames();
  }
}
