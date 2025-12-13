// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArticlesStore on _ArticlesStore, Store {
  late final _$articlesAtom = Atom(
    name: '_ArticlesStore.articles',
    context: context,
  );

  @override
  ObservableList<Article> get articles {
    _$articlesAtom.reportRead();
    return super.articles;
  }

  @override
  set articles(ObservableList<Article> value) {
    _$articlesAtom.reportWrite(value, super.articles, () {
      super.articles = value;
    });
  }

  late final _$selectedArticleAtom = Atom(
    name: '_ArticlesStore.selectedArticle',
    context: context,
  );

  @override
  Article? get selectedArticle {
    _$selectedArticleAtom.reportRead();
    return super.selectedArticle;
  }

  @override
  set selectedArticle(Article? value) {
    _$selectedArticleAtom.reportWrite(value, super.selectedArticle, () {
      super.selectedArticle = value;
    });
  }

  late final _$_ArticlesStoreActionController = ActionController(
    name: '_ArticlesStore',
    context: context,
  );

  @override
  void selectArticle(Article article) {
    final _$actionInfo = _$_ArticlesStoreActionController.startAction(
      name: '_ArticlesStore.selectArticle',
    );
    try {
      return super.selectArticle(article);
    } finally {
      _$_ArticlesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addArticle(String title, String summary, String body) {
    final _$actionInfo = _$_ArticlesStoreActionController.startAction(
      name: '_ArticlesStore.addArticle',
    );
    try {
      return super.addArticle(title, summary, body);
    } finally {
      _$_ArticlesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateArticle(String id, String title, String summary, String body) {
    final _$actionInfo = _$_ArticlesStoreActionController.startAction(
      name: '_ArticlesStore.updateArticle',
    );
    try {
      return super.updateArticle(id, title, summary, body);
    } finally {
      _$_ArticlesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
articles: ${articles},
selectedArticle: ${selectedArticle}
    ''';
  }
}
