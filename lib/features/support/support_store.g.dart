// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SupportStore on _SupportStore, Store {
  late final _$subjectAtom = Atom(
    name: '_SupportStore.subject',
    context: context,
  );

  @override
  String get subject {
    _$subjectAtom.reportRead();
    return super.subject;
  }

  @override
  set subject(String value) {
    _$subjectAtom.reportWrite(value, super.subject, () {
      super.subject = value;
    });
  }

  late final _$messageAtom = Atom(
    name: '_SupportStore.message',
    context: context,
  );

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$isSentAtom = Atom(
    name: '_SupportStore.isSent',
    context: context,
  );

  @override
  bool get isSent {
    _$isSentAtom.reportRead();
    return super.isSent;
  }

  @override
  set isSent(bool value) {
    _$isSentAtom.reportWrite(value, super.isSent, () {
      super.isSent = value;
    });
  }

  late final _$isSendingAtom = Atom(
    name: '_SupportStore.isSending',
    context: context,
  );

  @override
  bool get isSending {
    _$isSendingAtom.reportRead();
    return super.isSending;
  }

  @override
  set isSending(bool value) {
    _$isSendingAtom.reportWrite(value, super.isSending, () {
      super.isSending = value;
    });
  }

  late final _$sendFeedbackAsyncAction = AsyncAction(
    '_SupportStore.sendFeedback',
    context: context,
  );

  @override
  Future<void> sendFeedback() {
    return _$sendFeedbackAsyncAction.run(() => super.sendFeedback());
  }

  late final _$_SupportStoreActionController = ActionController(
    name: '_SupportStore',
    context: context,
  );

  @override
  void setSubject(String value) {
    final _$actionInfo = _$_SupportStoreActionController.startAction(
      name: '_SupportStore.setSubject',
    );
    try {
      return super.setSubject(value);
    } finally {
      _$_SupportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMessage(String value) {
    final _$actionInfo = _$_SupportStoreActionController.startAction(
      name: '_SupportStore.setMessage',
    );
    try {
      return super.setMessage(value);
    } finally {
      _$_SupportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
subject: ${subject},
message: ${message},
isSent: ${isSent},
isSending: ${isSending}
    ''';
  }
}
