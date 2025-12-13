import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../games/widgets/game_card.dart';
import 'games_notes_store.dart';

class GamesNotesScreen extends StatefulWidget {
  const GamesNotesScreen({super.key});

  @override
  State<GamesNotesScreen> createState() => _GamesNotesScreenState();
}

class _GamesNotesScreenState extends State<GamesNotesScreen> {
  final store = GetIt.I<GamesNotesStore>();
  final noteController = TextEditingController();
  final tagsController = TextEditingController();

  String? selectedGameId;

  @override
  void dispose() {
    noteController.dispose();
    tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Игры и заметки'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Добавить игру',
            onPressed: () => context.go('/add'),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          final games = store.games;
          selectedGameId ??= games.isNotEmpty ? games.first.id : null;

          if (games.isEmpty) {
            return const Center(child: Text('Нет игр для заметок'));
          }

          final notes = selectedGameId != null
              ? store.notesForGame(selectedGameId!)
              : [];

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              DropdownButtonFormField<String>(
                value: selectedGameId,
                decoration: const InputDecoration(labelText: 'Игра'),
                items: games
                    .map(
                      (g) => DropdownMenuItem(
                        value: g.id,
                        child: Text(g.title),
                      ),
                    )
                    .toList(),
                onChanged: (value) => setState(() => selectedGameId = value),
              ),
              const SizedBox(height: 12),
              if (selectedGameId != null)
                Text(
                  'Заметки по игре',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              const SizedBox(height: 8),
              ...notes.map(
                (note) => Card(
                  child: ListTile(
                    title: Text(note.text),
                    subtitle: Text(
                      'Создано: ${note.createdAt.toLocal()}'
                          '\nТеги: ${note.tags.isEmpty ? 'нет' : note.tags.join(', ')}',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => store.removeNote(note.id),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: noteController,
                decoration: const InputDecoration(
                  labelText: 'Новая заметка',
                  border: OutlineInputBorder(),
                ),
                minLines: 1,
                maxLines: 3,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: tagsController,
                decoration: const InputDecoration(
                  labelText: 'Теги (через запятую)',
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: selectedGameId == null
                    ? null
                    : () {
                        final tags = tagsController.text
                            .split(',')
                            .map((e) => e.trim())
                            .where((e) => e.isNotEmpty)
                            .toList();
                        store.addNote(selectedGameId!, noteController.text, tags: tags);
                        noteController.clear();
                        tagsController.clear();
                      },
                child: const Text('Сохранить заметку'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Список игр',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              ...games.map(
                (g) => GestureDetector(
                  onTap: () => context.go('/detail/${g.id}'),
                  child: GameCard(game: g),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
