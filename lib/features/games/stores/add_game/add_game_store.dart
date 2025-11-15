import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import '../../models/game.dart';
import '../../services/game_service.dart';

part 'add_game_store.g.dart';

class AddGameStore = _AddGameStore with _$AddGameStore;

abstract class _AddGameStore with Store {
  final service = GetIt.I<GameService>();

  @observable
  String title = '';

  @observable
  String genre = '';

  @observable
  String status = 'Planned';

  @observable
  double rating = 0;

  @observable
  String imageUrl = '';

  @observable
  String comment = '';

  @computed
  bool get canSave => title.isNotEmpty && genre.isNotEmpty;

  @action
  void setTitle(String v) => title = v;

  @action
  void setGenre(String v) => genre = v;

  @action
  void setStatus(String v) => status = v;

  @action
  void setRating(String v) =>
      rating = double.tryParse(v) ?? 0;

  @action
  void setImageUrl(String v) => imageUrl = v;

  @action
  void setComment(String v) => comment = v;

  @action
  void save() {
    final game = Game(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      genre: genre,
      status: status,
      imageUrl: imageUrl,
      rating: rating,
      comment: comment,
    );

    service.addGame(game);
  }
}
