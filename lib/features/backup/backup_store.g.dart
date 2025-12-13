// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BackupStore on _BackupStore, Store {
  late final _$isExportingAtom = Atom(
    name: '_BackupStore.isExporting',
    context: context,
  );

  @override
  bool get isExporting {
    _$isExportingAtom.reportRead();
    return super.isExporting;
  }

  @override
  set isExporting(bool value) {
    _$isExportingAtom.reportWrite(value, super.isExporting, () {
      super.isExporting = value;
    });
  }

  late final _$isImportingAtom = Atom(
    name: '_BackupStore.isImporting',
    context: context,
  );

  @override
  bool get isImporting {
    _$isImportingAtom.reportRead();
    return super.isImporting;
  }

  @override
  set isImporting(bool value) {
    _$isImportingAtom.reportWrite(value, super.isImporting, () {
      super.isImporting = value;
    });
  }

  late final _$statusMessageAtom = Atom(
    name: '_BackupStore.statusMessage',
    context: context,
  );

  @override
  String get statusMessage {
    _$statusMessageAtom.reportRead();
    return super.statusMessage;
  }

  @override
  set statusMessage(String value) {
    _$statusMessageAtom.reportWrite(value, super.statusMessage, () {
      super.statusMessage = value;
    });
  }

  late final _$exportDataAsyncAction = AsyncAction(
    '_BackupStore.exportData',
    context: context,
  );

  @override
  Future<void> exportData() {
    return _$exportDataAsyncAction.run(() => super.exportData());
  }

  late final _$importDataAsyncAction = AsyncAction(
    '_BackupStore.importData',
    context: context,
  );

  @override
  Future<void> importData() {
    return _$importDataAsyncAction.run(() => super.importData());
  }

  @override
  String toString() {
    return '''
isExporting: ${isExporting},
isImporting: ${isImporting},
statusMessage: ${statusMessage}
    ''';
  }
}
