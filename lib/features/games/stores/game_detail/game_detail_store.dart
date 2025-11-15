import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import '../../models/game.dart';
import '../../services/game_service.dart';

part 'game_detail_store.g.dart';

class GameDetailStore = _GameDetailStore with _$GameDetailStore;

abstract class _GameDetailStore with Store {
  final service = GetIt.I<GameService>();

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
  }
}
