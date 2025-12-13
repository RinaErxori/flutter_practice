import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'articles_store.dart';
import 'models/article.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I<ArticlesStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Библиотека материалов'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Добавить статью',
            onPressed: () => _showArticleDialog(context, store),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Observer(
            builder: (_) {
              final isWide = constraints.maxWidth > 700;
              final list = store.articles
                  .map(
                    (article) => Card(
                      child: ListTile(
                        title: Text(article.title),
                        subtitle: Text(article.summary),
                        onTap: () => store.selectArticle(article),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit_outlined),
                          onPressed: () => _showArticleDialog(context, store, article: article),
                        ),
                      ),
                    ),
                  )
                  .toList();

              final detail = Padding(
                padding: const EdgeInsets.all(16),
                child: store.selectedArticle == null
                    ? const Text('Выберите статью для чтения')
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            store.selectedArticle!.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(store.selectedArticle!.body),
                          const SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: OutlinedButton.icon(
                              icon: const Icon(Icons.edit_outlined),
                              label: const Text('Изменить'),
                              onPressed: () {
                                final article = store.selectedArticle!;
                                _showArticleDialog(context, store, article: article);
                              },
                            ),
                          ),
                        ],
                      ),
              );

              if (isWide) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: ListView(
                        padding: const EdgeInsets.all(16),
                        children: list,
                      ),
                    ),
                    Expanded(flex: 3, child: SingleChildScrollView(child: detail)),
                  ],
                );
              }

              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(children: list),
                  ),
                  const Divider(),
                  detail,
                ],
              );
            },
          );
        },
      ),
    );
  }
}

Future<void> _showArticleDialog(BuildContext context, ArticlesStore store, {Article? article}) async {
  final titleCtrl = TextEditingController(text: article?.title ?? '');
  final summaryCtrl = TextEditingController(text: article?.summary ?? '');
  final bodyCtrl = TextEditingController(text: article?.body ?? '');

  final result = await showDialog<bool>(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(article == null ? 'Новая статья' : 'Изменить статью'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(labelText: 'Заголовок'),
            ),
            TextField(
              controller: summaryCtrl,
              decoration: const InputDecoration(labelText: 'Краткое описание'),
            ),
            TextField(
              controller: bodyCtrl,
              minLines: 4,
              maxLines: 6,
              decoration: const InputDecoration(
                labelText: 'Текст',
                alignLabelWithHint: true,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Отмена'),
        ),
        ElevatedButton(
          onPressed: () {
            if (article == null) {
              store.addArticle(
                titleCtrl.text.trim(),
                summaryCtrl.text.trim(),
                bodyCtrl.text.trim(),
              );
            } else {
              store.updateArticle(
                article.id,
                titleCtrl.text.trim(),
                summaryCtrl.text.trim(),
                bodyCtrl.text.trim(),
              );
            }
            Navigator.of(context).pop(true);
          },
          child: const Text('Сохранить'),
        ),
      ],
    ),
  );

  if (result == true) {
  }
}
