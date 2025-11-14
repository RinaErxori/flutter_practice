import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../models/game.dart';
import '../services/game_service.dart';

class AddEditGameScreen extends StatefulWidget {
  const AddEditGameScreen({super.key});

  @override
  State<AddEditGameScreen> createState() => _AddEditGameScreenState();
}

class _AddEditGameScreenState extends State<AddEditGameScreen> {
  final _titleController = TextEditingController();
  final _genreController = TextEditingController();
  final _imageController = TextEditingController();
  final _ratingController = TextEditingController();
  final _commentController = TextEditingController();

  String _selectedStatus = 'Planned';


  void _save() {

    final game = Game(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text.trim(),
      genre: _genreController.text.trim(),
      status: _selectedStatus,
      imageUrl: _imageController.text.trim(),
      rating: double.tryParse(_ratingController.text) ?? 0,
      comment: _commentController.text.trim(),
    );

    GetIt.I<GameService>().addGame(game);

    context.go("/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить игру'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go("/"),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _save,
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Название'),
          ),
          TextField(
            controller: _genreController,
            decoration: const InputDecoration(labelText: 'Жанр'),
          ),
          TextField(
            controller: _imageController,
            decoration: const InputDecoration(labelText: 'URL картинки'),
          ),
          TextField(
            controller: _ratingController,
            decoration: const InputDecoration(labelText: 'Рейтинг'),
          ),
          TextField(
            controller: _commentController,
            decoration: const InputDecoration(labelText: 'Комментарий'),
          ),

          const SizedBox(height: 20),

          DropdownButtonFormField<String>(
            value: _selectedStatus,
            items: const [
              DropdownMenuItem(value: 'Planned', child: Text('Запланировано')),
              DropdownMenuItem(value: 'Playing', child: Text('Играю')),
              DropdownMenuItem(value: 'Completed', child: Text('Пройдено')),
            ],
            onChanged: (v) => setState(() => _selectedStatus = v!),
          ),
        ],
      ),
    );
  }
}