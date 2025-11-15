import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../stores/add_game/add_game_store.dart';
import 'package:go_router/go_router.dart';

class AddEditGameScreen extends StatelessWidget {
  const AddEditGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I<AddGameStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Добавить игру"),
        actions: [
          Observer(
            builder: (_) => IconButton(
              icon: const Icon(Icons.save),
              onPressed: store.canSave
                  ? () {
                store.save();
                context.go('/');
              }
                  : null,
            ),
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Название'),
            onChanged: store.setTitle,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Жанр'),
            onChanged: store.setGenre,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'URL обложки'),
            onChanged: store.setImageUrl,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Рейтинг'),
            keyboardType: TextInputType.number,
            onChanged: store.setRating,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Комментарий'),
            onChanged: store.setComment,
          ),

          const SizedBox(height: 16),
          Observer(
            builder: (_) => DropdownButton<String>(
              value: store.status,
              items: const [
                DropdownMenuItem(value: 'Planned', child: Text("Запланировано")),
                DropdownMenuItem(value: 'Playing', child: Text("Играю")),
                DropdownMenuItem(value: 'Completed', child: Text("Пройдено")),
              ],
              onChanged: (v) => store.setStatus(v!),
            ),
          ),
        ],
      ),
    );
  }
}