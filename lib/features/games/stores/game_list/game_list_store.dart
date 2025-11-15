import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import '../../models/game.dart';
import '../../services/game_service.dart';

part 'game_list_store.g.dart';

class GameListStore = _GameListStore with _$GameListStore;

abstract class _GameListStore with Store {
  final service = GetIt.I<GameService>();

  @observable
  String search = '';

  @computed
  List<Game> get filtered {
    final q = search.toLowerCase();
    return service.games
        .where((g) => g.title.toLowerCase().contains(q))
        .toList();
  }

  @action
  void setSearch(String value) => search = value;
}
