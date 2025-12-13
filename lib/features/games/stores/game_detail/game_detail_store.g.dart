// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameDetailStore on _GameDetailStore, Store {
  late final _$gameAtom = Atom(name: '_GameDetailStore.game', context: context);

  @override
  Game? get game {
    _$gameAtom.reportRead();
    return super.game;
  }

  @override
  set game(Game? value) {
    _$gameAtom.reportWrite(value, super.game, () {
      super.game = value;
    });
  }

  late final _$_GameDetailStoreActionController = ActionController(
    name: '_GameDetailStore',
    context: context,
  );

  @override
  void load(String id) {
    final _$actionInfo = _$_GameDetailStoreActionController.startAction(
      name: '_GameDetailStore.load',
    );
    try {
      return super.load(id);
    } finally {
      _$_GameDetailStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleStatus() {
    final _$actionInfo = _$_GameDetailStoreActionController.startAction(
      name: '_GameDetailStore.toggleStatus',
    );
    try {
      return super.toggleStatus();
    } finally {
      _$_GameDetailStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateGame(Game updated) {
    final _$actionInfo = _$_GameDetailStoreActionController.startAction(
      name: '_GameDetailStore.updateGame',
    );
    try {
      return super.updateGame(updated);
    } finally {
      _$_GameDetailStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteGame() {
    final _$actionInfo = _$_GameDetailStoreActionController.startAction(
      name: '_GameDetailStore.deleteGame',
    );
    try {
      return super.deleteGame();
    } finally {
      _$_GameDetailStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
game: ${game}
    ''';
  }
}
