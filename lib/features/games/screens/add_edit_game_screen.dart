import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/game.dart';
import '../services/game_service.dart';

class AddEditGameScreen extends StatefulWidget {
  final GameService gameService;
  const AddEditGameScreen({super.key, required this.gameService});

  @override
  State<AddEditGameScreen> createState() => _AddEditGameScreenState();
}

class _AddEditGameScreenState extends State<AddEditGameScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();

  Future<void> _navigateToGames() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить игру'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Название игры',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _genreController,
              decoration: const InputDecoration(
                labelText: 'Жанр игры',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () async {
                  if (_titleController.text.trim().isEmpty ||
                      _genreController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Введите название и жанр игры!'),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                    return;
                  }

                  // Создаём новую игру
                  final newGame = Game(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: _titleController.text.trim(),
                    genre: _genreController.text.trim(),
                    status: 'Planned',
                    imageUrl: 'https://picsum.photos/400',
                    rating: 0.0,
                    comment: '',
                  );

                  widget.gameService.addGame(newGame);

                  // Показываем уведомление пользователю
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Игра успешно добавлена! Переход на главный экран...'),
                      duration: Duration(seconds: 2),
                    ),
                  );

                  // ⏳ Небольшая задержка и горизонтальный переход
                  await _navigateToGames();
                },
                icon: const Icon(Icons.save),
                label: const Text('Сохранить игру'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
