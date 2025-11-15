import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import '../../models/game.dart';
import '../../services/game_service.dart';

part 'completed_games_store.g.dart';

class CompletedGamesStore = _CompletedGamesStore with _$CompletedGamesStore;

abstract class _CompletedGamesStore with Store {
  final service = GetIt.I<GameService>();

  @observable
  ObservableList<Game> completed = ObservableList<Game>();

  @action
  void load() {
    completed = ObservableList.of(
      service.games.where((g) => g.status == 'Completed'),
    );
  }

  @action
  void delete(String id) {
    service.deleteGame(id);
    load();
  }
}
