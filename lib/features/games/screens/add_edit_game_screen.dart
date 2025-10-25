import 'package:flutter/material.dart';
import '../models/game.dart';

class AddEditGameScreen extends StatefulWidget {
  final Game? game;
  const AddEditGameScreen({super.key, this.game});

  @override
  State<AddEditGameScreen> createState() => _AddEditGameScreenState();
}

class _AddEditGameScreenState extends State<AddEditGameScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _title, _genre, _comment, _imageUrl;
  double? _rating;
  String _status = 'Хочу пройти';

  final statuses = const ['Хочу пройти', 'Играю', 'Пройдено'];

  @override
  void initState() {
    super.initState();
    final g = widget.game;
    _title = TextEditingController(text: g?.title ?? '');
    _genre = TextEditingController(text: g?.genre ?? '');
    _comment = TextEditingController(text: g?.comment ?? '');
    _imageUrl = TextEditingController(text: g?.imageUrl ?? '');
    _rating = g?.rating;
    _status = g?.status ?? _status;
  }

  @override
  void dispose() {
    _title.dispose();
    _genre.dispose();
    _comment.dispose();
    _imageUrl.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    final newGame = Game(
      id: widget.game?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      title: _title.text,
      genre: _genre.text,
      status: _status,
      rating: _rating,
      comment: _comment.text,
      imageUrl: _imageUrl.text,
    );
    Navigator.pop(context, newGame);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Добавить / редактировать игру')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _title,
                decoration: const InputDecoration(labelText: 'Название'),
                validator: (v) =>
                v == null || v.isEmpty ? 'Введите название' : null,
              ),
              TextFormField(
                controller: _genre,
                decoration: const InputDecoration(labelText: 'Жанр'),
              ),
              DropdownButtonFormField<String>(
                value: _status,
                items: statuses
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (v) => setState(() => _status = v!),
                decoration: const InputDecoration(labelText: 'Статус'),
              ),
              TextFormField(
                controller: _imageUrl,
                decoration:
                const InputDecoration(labelText: 'Ссылка на обложку'),
              ),
              TextFormField(
                controller: _comment,
                decoration: const InputDecoration(labelText: 'Комментарий'),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _save,
                icon: const Icon(Icons.save),
                label: const Text('Сохранить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
