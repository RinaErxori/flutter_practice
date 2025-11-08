import 'package:flutter/material.dart';
import '../models/game.dart';
import '../services/game_service.dart';
import 'game_list_screen.dart';

class AddEditGameScreen extends StatelessWidget {
  final GameService gameService;
  const AddEditGameScreen({super.key, required this.gameService});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final genreController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить/Редактировать игру'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Название игры')),
            const SizedBox(height: 8),
            TextField(controller: genreController, decoration: const InputDecoration(labelText: 'Жанр игры')),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                final newGame = Game(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: titleController.text,
                  genre: genreController.text,
                  status: 'Planned',
                  imageUrl: 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/413150/header.jpg',
                  rating: 0.0,
                  comment: '',
                );
                gameService.addGame(newGame);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => GameListScreen(gameService: gameService),
                  ),
                );
              },
              icon: const Icon(Icons.save),
              label: const Text('Сохранить игру (горизонтально)'),
            ),
          ],
        ),
      ),
    );
  }
}
