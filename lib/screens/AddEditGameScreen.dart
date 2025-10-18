import 'package:flutter/material.dart';
import '../models/Game.dart';

class AddEditGameScreen extends StatefulWidget {
  final Game? game;
  const AddEditGameScreen({this.game});

  @override
  State<AddEditGameScreen> createState() => _AddEditGameScreenState();
}

class _AddEditGameScreenState extends State<AddEditGameScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title, _genre, _status;
  double _rating = 0;
  String? _comment;
  final _statuses = ['Хочу пройти', 'Играю', 'Пройдено'];

  @override
  void initState() {
    super.initState();
    final g = widget.game;
    _title = g?.title ?? '';
    _genre = g?.genre ?? '';
    _status = g?.status ?? 'Хочу пройти';
    _rating = g?.rating ?? 0;
    _comment = g?.comment;
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    final id = widget.game?.id ?? DateTime.now().millisecondsSinceEpoch.toString();
    final game = Game(
      id: id,
      title: _title,
      genre: _genre,
      status: _status,
      rating: _rating,
      comment: _comment,
    );
    Navigator.pop(context, game);
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.game != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Редактировать игру' : 'Добавить игру'),
        actions: [IconButton(icon: const Icon(Icons.check), onPressed: _save)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: const InputDecoration(labelText: 'Название'),
                validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Введите название' : null,
                onSaved: (v) => _title = v!.trim(),
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: _genre,
                decoration: const InputDecoration(labelText: 'Жанр'),
                onSaved: (v) => _genre = v?.trim() ?? '',
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _status,
                decoration: const InputDecoration(labelText: 'Статус'),
                items: _statuses
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (v) => setState(() => _status = v!),
              ),
              const SizedBox(height: 20),
              Text(
                'Рейтинг: ${_rating.toStringAsFixed(1)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Slider(
                min: 0,
                max: 10,
                divisions: 20,
                label: _rating.toStringAsFixed(1),
                value: _rating,
                onChanged: (v) => setState(() => _rating = v),
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: _comment,
                decoration: const InputDecoration(labelText: 'Комментарий'),
                maxLines: 3,
                onSaved: (v) => _comment = v?.trim(),
              ),
              const SizedBox(height: 24),
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
