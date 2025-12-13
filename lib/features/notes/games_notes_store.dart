import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../activity/activity_log_store.dart';
import '../games/models/game.dart';
import '../games/services/game_service.dart';
import 'models/note.dart';

part 'games_notes_store.g.dart';

class GamesNotesStore = _GamesNotesStore with _$GamesNotesStore;

abstract class _GamesNotesStore with Store {
  final service = GetIt.I<GameService>();
  final logStore = GetIt.I<ActivityLogStore>();

  _GamesNotesStore() {
    refreshGames();
  }

  @observable
  ObservableList<Game> games = ObservableList<Game>();

  @observable
  ObservableMap<String, ObservableList<Note>> notesByGame =
      ObservableMap<String, ObservableList<Note>>();

  @computed
  List<Note> get allNotes =>
      notesByGame.values.expand((list) => list).toList(growable: false);

  ObservableList<Note> notesForGame(String gameId) {
    return notesByGame[gameId] ?? ObservableList<Note>();
  }

  @action
  void refreshGames() {
    games = ObservableList.of(service.games);
  }

  @action
  void addGame(Game game) {
    service.addGame(game);
    refreshGames();
    logStore.logAction('Добавлена игра ${game.title}', category: 'games');
  }

  @action
  void addNote(String gameId, String text, {List<String> tags = const []}) {
    if (text.isEmpty) return;

    final note = Note(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      gameId: gameId,
      text: text,
      createdAt: DateTime.now(),
      tags: List<String>.from(tags),
    );

    notesByGame.putIfAbsent(gameId, () => ObservableList<Note>());
    notesByGame[gameId]!.add(note);

    logStore.logAction('Добавлена заметка к игре $gameId', category: 'notes');
  }

  @action
  void updateNote(String noteId, String newText) {
    if (newText.isEmpty) return;

    for (final entry in notesByGame.entries) {
      final index = entry.value.indexWhere((n) => n.id == noteId);
      if (index != -1) {
        final current = entry.value[index];
        entry.value[index] = current.copyWith(text: newText);
        logStore.logAction('Изменена заметка "${current.text}"', category: 'notes');
        return;
      }
    }
  }

  @action
  void removeNote(String noteId) {
    for (final entry in notesByGame.entries) {
      final index = entry.value.indexWhere((n) => n.id == noteId);
      if (index != -1) {
        final removed = entry.value.removeAt(index);
        logStore.logAction(
          'Удалена заметка "${removed.text}"',
          category: 'notes',
        );
        return;
      }
    }
  }
}
