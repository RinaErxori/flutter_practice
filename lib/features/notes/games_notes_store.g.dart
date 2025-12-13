// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games_notes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GamesNotesStore on _GamesNotesStore, Store {
  Computed<List<Note>>? _$allNotesComputed;

  @override
  List<Note> get allNotes => (_$allNotesComputed ??= Computed<List<Note>>(
    () => super.allNotes,
    name: '_GamesNotesStore.allNotes',
  )).value;

  late final _$gamesAtom = Atom(
    name: '_GamesNotesStore.games',
    context: context,
  );

  @override
  ObservableList<Game> get games {
    _$gamesAtom.reportRead();
    return super.games;
  }

  @override
  set games(ObservableList<Game> value) {
    _$gamesAtom.reportWrite(value, super.games, () {
      super.games = value;
    });
  }

  late final _$notesByGameAtom = Atom(
    name: '_GamesNotesStore.notesByGame',
    context: context,
  );

  @override
  ObservableMap<String, ObservableList<Note>> get notesByGame {
    _$notesByGameAtom.reportRead();
    return super.notesByGame;
  }

  @override
  set notesByGame(ObservableMap<String, ObservableList<Note>> value) {
    _$notesByGameAtom.reportWrite(value, super.notesByGame, () {
      super.notesByGame = value;
    });
  }

  late final _$_GamesNotesStoreActionController = ActionController(
    name: '_GamesNotesStore',
    context: context,
  );

  @override
  void refreshGames() {
    final _$actionInfo = _$_GamesNotesStoreActionController.startAction(
      name: '_GamesNotesStore.refreshGames',
    );
    try {
      return super.refreshGames();
    } finally {
      _$_GamesNotesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addGame(Game game) {
    final _$actionInfo = _$_GamesNotesStoreActionController.startAction(
      name: '_GamesNotesStore.addGame',
    );
    try {
      return super.addGame(game);
    } finally {
      _$_GamesNotesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNote(String gameId, String text, {List<String> tags = const []}) {
    final _$actionInfo = _$_GamesNotesStoreActionController.startAction(
      name: '_GamesNotesStore.addNote',
    );
    try {
      return super.addNote(gameId, text, tags: tags);
    } finally {
      _$_GamesNotesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateNote(String noteId, String newText) {
    final _$actionInfo = _$_GamesNotesStoreActionController.startAction(
      name: '_GamesNotesStore.updateNote',
    );
    try {
      return super.updateNote(noteId, newText);
    } finally {
      _$_GamesNotesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeNote(String noteId) {
    final _$actionInfo = _$_GamesNotesStoreActionController.startAction(
      name: '_GamesNotesStore.removeNote',
    );
    try {
      return super.removeNote(noteId);
    } finally {
      _$_GamesNotesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
games: ${games},
notesByGame: ${notesByGame},
allNotes: ${allNotes}
    ''';
  }
}
