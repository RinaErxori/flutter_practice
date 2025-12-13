// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameListStore on _GameListStore, Store {
  Computed<List<Game>>? _$filteredComputed;

  @override
  List<Game> get filtered => (_$filteredComputed ??= Computed<List<Game>>(
    () => super.filtered,
    name: '_GameListStore.filtered',
  )).value;

  late final _$searchAtom = Atom(
    name: '_GameListStore.search',
    context: context,
  );

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$_GameListStoreActionController = ActionController(
    name: '_GameListStore',
    context: context,
  );

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_GameListStoreActionController.startAction(
      name: '_GameListStore.setSearch',
    );
    try {
      return super.setSearch(value);
    } finally {
      _$_GameListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search},
filtered: ${filtered}
    ''';
  }
}
