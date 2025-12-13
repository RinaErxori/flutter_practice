// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_game_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddGameStore on _AddGameStore, Store {
  Computed<bool>? _$canSaveComputed;

  @override
  bool get canSave => (_$canSaveComputed ??= Computed<bool>(
    () => super.canSave,
    name: '_AddGameStore.canSave',
  )).value;

  late final _$titleAtom = Atom(name: '_AddGameStore.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$genreAtom = Atom(name: '_AddGameStore.genre', context: context);

  @override
  String get genre {
    _$genreAtom.reportRead();
    return super.genre;
  }

  @override
  set genre(String value) {
    _$genreAtom.reportWrite(value, super.genre, () {
      super.genre = value;
    });
  }

  late final _$statusAtom = Atom(
    name: '_AddGameStore.status',
    context: context,
  );

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$ratingAtom = Atom(
    name: '_AddGameStore.rating',
    context: context,
  );

  @override
  double get rating {
    _$ratingAtom.reportRead();
    return super.rating;
  }

  @override
  set rating(double value) {
    _$ratingAtom.reportWrite(value, super.rating, () {
      super.rating = value;
    });
  }

  late final _$imageUrlAtom = Atom(
    name: '_AddGameStore.imageUrl',
    context: context,
  );

  @override
  String get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(String value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  late final _$commentAtom = Atom(
    name: '_AddGameStore.comment',
    context: context,
  );

  @override
  String get comment {
    _$commentAtom.reportRead();
    return super.comment;
  }

  @override
  set comment(String value) {
    _$commentAtom.reportWrite(value, super.comment, () {
      super.comment = value;
    });
  }

  late final _$_AddGameStoreActionController = ActionController(
    name: '_AddGameStore',
    context: context,
  );

  @override
  void setTitle(String v) {
    final _$actionInfo = _$_AddGameStoreActionController.startAction(
      name: '_AddGameStore.setTitle',
    );
    try {
      return super.setTitle(v);
    } finally {
      _$_AddGameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGenre(String v) {
    final _$actionInfo = _$_AddGameStoreActionController.startAction(
      name: '_AddGameStore.setGenre',
    );
    try {
      return super.setGenre(v);
    } finally {
      _$_AddGameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(String v) {
    final _$actionInfo = _$_AddGameStoreActionController.startAction(
      name: '_AddGameStore.setStatus',
    );
    try {
      return super.setStatus(v);
    } finally {
      _$_AddGameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRating(String v) {
    final _$actionInfo = _$_AddGameStoreActionController.startAction(
      name: '_AddGameStore.setRating',
    );
    try {
      return super.setRating(v);
    } finally {
      _$_AddGameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImageUrl(String v) {
    final _$actionInfo = _$_AddGameStoreActionController.startAction(
      name: '_AddGameStore.setImageUrl',
    );
    try {
      return super.setImageUrl(v);
    } finally {
      _$_AddGameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComment(String v) {
    final _$actionInfo = _$_AddGameStoreActionController.startAction(
      name: '_AddGameStore.setComment',
    );
    try {
      return super.setComment(v);
    } finally {
      _$_AddGameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void save() {
    final _$actionInfo = _$_AddGameStoreActionController.startAction(
      name: '_AddGameStore.save',
    );
    try {
      return super.save();
    } finally {
      _$_AddGameStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
genre: ${genre},
status: ${status},
rating: ${rating},
imageUrl: ${imageUrl},
comment: ${comment},
canSave: ${canSave}
    ''';
  }
}
