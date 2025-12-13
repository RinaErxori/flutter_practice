// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_games_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CompletedGamesStore on _CompletedGamesStore, Store {
  late final _$completedAtom = Atom(
    name: '_CompletedGamesStore.completed',
    context: context,
  );

  @override
  ObservableList<Game> get completed {
    _$completedAtom.reportRead();
    return super.completed;
  }

  @override
  set completed(ObservableList<Game> value) {
    _$completedAtom.reportWrite(value, super.completed, () {
      super.completed = value;
    });
  }

  late final _$_CompletedGamesStoreActionController = ActionController(
    name: '_CompletedGamesStore',
    context: context,
  );

  @override
  void load() {
    final _$actionInfo = _$_CompletedGamesStoreActionController.startAction(
      name: '_CompletedGamesStore.load',
    );
    try {
      return super.load();
    } finally {
      _$_CompletedGamesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete(String id) {
    final _$actionInfo = _$_CompletedGamesStoreActionController.startAction(
      name: '_CompletedGamesStore.delete',
    );
    try {
      return super.delete(id);
    } finally {
      _$_CompletedGamesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
completed: ${completed}
    ''';
  }
}
