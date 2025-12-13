import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../activity/activity_log_store.dart';
import 'models/article.dart';

part 'articles_store.g.dart';

class ArticlesStore = _ArticlesStore with _$ArticlesStore;

abstract class _ArticlesStore with Store {
  final logStore = GetIt.I<ActivityLogStore>();

  @observable
  ObservableList<Article> articles = ObservableList.of([
    Article(
      id: 'a1',
      title: 'Как вести заметки по играм',
      summary: 'Быстрые советы по фиксации прогресса и впечатлений.',
      body:
          'Пишите коротко, фиксируйте ключевые события, отмечайте эмоции. Используйте теги по жанрам и сложности.',
    ),
    Article(
      id: 'a2',
      title: 'Гайды по анализу геймдизайна',
      summary: 'На что смотреть, чтобы разбирать игры глубже.',
      body:
          'Смотрите на петли геймплея, моменты кайфа, темп изменений и точки выхода. Сохраняйте сравнения в заметках.',
    ),
    Article(
      id: 'a3',
      title: 'Как не потерять данные',
      summary: 'Простой чек-лист бэкапов.',
      body:
          'Регулярный экспорт заметок, проверка целостности файлов и синхронизация между устройствами раз в неделю.',
    ),
  ]);

  @observable
  Article? selectedArticle;

  @action
  void selectArticle(Article article) {
    selectedArticle = article;
    logStore.logAction('Открыта статья ${article.title}', category: 'articles');
  }

  @action
  void addArticle(String title, String summary, String body) {
    if (title.isEmpty || body.isEmpty) return;
    final article = Article(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      summary: summary.isEmpty ? body.substring(0, body.length.clamp(0, 50)) : summary,
      body: body,
    );
    articles.insert(0, article);
    selectedArticle = article;
    logStore.logAction('Добавлена статья $title', category: 'articles');
  }

  @action
  void updateArticle(String id, String title, String summary, String body) {
    final index = articles.indexWhere((a) => a.id == id);
    if (index == -1) return;

    final updated = Article(
      id: id,
      title: title,
      summary: summary,
      body: body,
    );
    articles[index] = updated;
    if (selectedArticle?.id == id) {
      selectedArticle = updated;
    }
    logStore.logAction('Обновлена статья $title', category: 'articles');
  }
}
