// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_log_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ActivityLogStore on _ActivityLogStore, Store {
  late final _$entriesAtom = Atom(
    name: '_ActivityLogStore.entries',
    context: context,
  );

  @override
  ObservableList<LogEntry> get entries {
    _$entriesAtom.reportRead();
    return super.entries;
  }

  @override
  set entries(ObservableList<LogEntry> value) {
    _$entriesAtom.reportWrite(value, super.entries, () {
      super.entries = value;
    });
  }

  late final _$_ActivityLogStoreActionController = ActionController(
    name: '_ActivityLogStore',
    context: context,
  );

  @override
  void logAction(String message, {String category = 'general'}) {
    final _$actionInfo = _$_ActivityLogStoreActionController.startAction(
      name: '_ActivityLogStore.logAction',
    );
    try {
      return super.logAction(message, category: category);
    } finally {
      _$_ActivityLogStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
entries: ${entries}
    ''';
  }
}
