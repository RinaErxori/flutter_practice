import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../stores/game_detail/game_detail_store.dart';

class GameDetailScreen extends StatefulWidget {
  final String id;
  const GameDetailScreen({super.key, required this.id});

  @override
  State<GameDetailScreen> createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  late final GameDetailStore store;

  @override
  void initState() {
    super.initState();
    store = GetIt.I<GameDetailStore>();
    store.load(widget.id);
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

              ElevatedButton(
                onPressed: () => store.toggleStatus(),
                child: const Text("Сменить статус"),
              ),
            ],
          );
        },
      ),
    );
  }
}
