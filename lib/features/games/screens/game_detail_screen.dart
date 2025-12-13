import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../games/models/game.dart';
import '../../notes/games_notes_store.dart';
import '../../notes/models/note.dart';
import '../stores/game_detail/game_detail_store.dart';

class GameDetailScreen extends StatefulWidget {
  final String id;
  const GameDetailScreen({super.key, required this.id});

  @override
  State<GameDetailScreen> createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  late final GameDetailStore store;
  final notesStore = GetIt.I<GamesNotesStore>();
  final noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    store = GetIt.I<GameDetailStore>();
    store.load(widget.id);
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Информация об игре"),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => context.go("/"),
      )),

      body: Observer(
        builder: (_) {
          final game = store.game;
          if (game == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Image.network(game.imageUrl, height: 200, fit: BoxFit.cover),
              const SizedBox(height: 16),
              Text(game.title, style: const TextStyle(fontSize: 24)),
              Text("Жанр: ${game.genre}"),
              Text("Статус: ${game.status}"),
              Text("Рейтинг: ${game.rating}"),

              const SizedBox(height: 20),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  FilledButton.icon(
                    onPressed: () => store.toggleStatus(),
                    icon: const Icon(Icons.repeat),
                    label: const Text("Сменить статус"),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => _showEditDialog(context, game),
                    icon: const Icon(Icons.edit_outlined),
                label: const Text("Редактировать"),
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                onPressed: () async {
                      final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Удалить игру?'),
                          content: const Text('Это удалит игру из списка.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('Отмена'),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text('Удалить'),
                            ),
                          ],
                        ),
                      );
                      if (confirmed == true) {
                        store.deleteGame();
                        if (mounted) context.go('/');
                      }
                    },
                    icon: const Icon(Icons.delete_outline),
                    label: const Text("Удалить"),
                  ),
                ],
              ),

              const SizedBox(height: 24),
              const Text(
                'Оценить игру',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Slider(
                value: game.rating.clamp(0, 5),
                min: 0,
                max: 5,
                divisions: 10,
                label: game.rating.toStringAsFixed(1),
                onChanged: (value) {
                  final updated = Game(
                    id: game.id,
                    title: game.title,
                    genre: game.genre,
                    status: game.status,
                    imageUrl: game.imageUrl,
                    rating: value,
                    comment: game.comment,
                  );
                  store.updateGame(updated);
                },
              ),

              const SizedBox(height: 12),
              const Text(
                'Заметки по игре',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Observer(
                builder: (_) {
                  final notes = notesStore.notesForGame(game.id);
                  if (notes.isEmpty) {
                    return const Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('Пока нет заметок. Добавьте первую ниже.'),
                      ),
                    );
                  }

                  return Column(
                    children: notes
                        .map(
                          (note) => _NoteTile(
                            note: note,
                            onEdit: (text) => notesStore.updateNote(note.id, text),
                            onDelete: () => notesStore.removeNote(note.id),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
              const SizedBox(height: 12),
              TextField(
                controller: noteController,
                decoration: const InputDecoration(
                  labelText: 'Новая заметка или правка',
                  border: OutlineInputBorder(),
                ),
                minLines: 1,
                maxLines: 3,
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    final text = noteController.text.trim();
                    if (text.isEmpty) return;
                    notesStore.addNote(game.id, text);
                    noteController.clear();
                  },
                  icon: const Icon(Icons.note_add_outlined),
                  label: const Text('Сохранить заметку'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  Future<void> _showEditDialog(BuildContext context, Game game) async {
    final titleCtrl = TextEditingController(text: game.title);
    final genreCtrl = TextEditingController(text: game.genre);
    final ratingCtrl = TextEditingController(text: game.rating.toString());
    final imageCtrl = TextEditingController(text: game.imageUrl);
    final commentCtrl = TextEditingController(text: game.comment);
    String status = game.status;

    final result = await showDialog<Game>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Редактировать игру'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleCtrl,
                decoration: const InputDecoration(labelText: 'Название'),
              ),
              TextField(
                controller: genreCtrl,
                decoration: const InputDecoration(labelText: 'Жанр'),
              ),
              DropdownButtonFormField<String>(
                value: status,
                decoration: const InputDecoration(labelText: 'Статус'),
                items: const [
                  DropdownMenuItem(value: 'Planned', child: Text('Запланировано')),
                  DropdownMenuItem(value: 'Playing', child: Text('Играю')),
                  DropdownMenuItem(value: 'Completed', child: Text('Пройдено')),
                ],
                onChanged: (v) => status = v ?? status,
              ),
              TextField(
                controller: ratingCtrl,
                decoration: const InputDecoration(labelText: 'Рейтинг'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: imageCtrl,
                decoration: const InputDecoration(labelText: 'URL обложки'),
              ),
              TextField(
                controller: commentCtrl,
                decoration: const InputDecoration(labelText: 'Комментарий'),
                minLines: 2,
                maxLines: 3,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () {
              final updated = Game(
                id: game.id,
                title: titleCtrl.text.trim().isEmpty ? game.title : titleCtrl.text.trim(),
                genre: genreCtrl.text.trim().isEmpty ? game.genre : genreCtrl.text.trim(),
                status: status,
                imageUrl: imageCtrl.text.trim().isEmpty ? game.imageUrl : imageCtrl.text.trim(),
                rating: double.tryParse(ratingCtrl.text.trim()) ?? game.rating,
                comment: commentCtrl.text.trim(),
              );
              Navigator.of(context).pop(updated);
            },
            child: const Text('Сохранить'),
          ),
        ],
      ),
    );

    if (result != null) {
      store.updateGame(result);
    }
  }
}

class _NoteTile extends StatelessWidget {
  final Note note;
  final void Function(String newText) onEdit;
  final VoidCallback onDelete;

  const _NoteTile({
    required this.note,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(note.text),
        subtitle: Text(
          'Создано: ${note.createdAt.toLocal().toString().split(".").first}',
        ),
        trailing: Wrap(
          spacing: 4,
          children: [
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              tooltip: 'Редактировать',
              onPressed: () async {
                final controller = TextEditingController(text: note.text);
                final result = await showDialog<String>(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Изменить заметку'),
                    content: TextField(
                      controller: controller,
                      minLines: 2,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Текст заметки',
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Отмена'),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            Navigator.of(context).pop(controller.text.trim()),
                        child: const Text('Сохранить'),
                      ),
                    ],
                  ),
                );
                if (result != null && result.isNotEmpty) {
                  onEdit(result);
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              tooltip: 'Удалить',
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
