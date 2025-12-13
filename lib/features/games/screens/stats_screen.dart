import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../services/game_service.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = GetIt.I<GameService>();
    final games = repo.games;

    final total = games.length;
    final planned = games.where((g) => g.status == 'Planned').length;
    final playing = games.where((g) => g.status == 'Playing').length;
    final completed = games.where((g) => g.status == 'Completed').length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Статистика'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _StatHeader(total: total),
            const SizedBox(height: 12),
            _QuickCards(planned: planned, playing: playing, completed: completed),
            const SizedBox(height: 16),
            _BarChart(planned: planned, playing: playing, completed: completed, total: total),
          ],
        ),
      ),
    );
  }
}

class _StatHeader extends StatelessWidget {
  final int total;
  const _StatHeader({required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF8E9BFF), Color(0xFF6DD5FA)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white24,
            child: Icon(Icons.equalizer, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Всего игр',
                style: TextStyle(color: Colors.white70),
              ),
              Text(
                '$total',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickCards extends StatelessWidget {
  final int planned;
  final int playing;
  final int completed;

  const _QuickCards({
    required this.planned,
    required this.playing,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _MiniCard(
            title: 'Запланировано',
            value: planned,
            color: Colors.orange.shade300,
            icon: Icons.schedule,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _MiniCard(
            title: 'Играю',
            value: playing,
            color: Colors.blue.shade300,
            icon: Icons.sports_esports,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _MiniCard(
            title: 'Пройдено',
            value: completed,
            color: Colors.green.shade300,
            icon: Icons.check_circle,
          ),
        ),
      ],
    );
  }
}

class _MiniCard extends StatelessWidget {
  final String title;
  final int value;
  final Color color;
  final IconData icon;

  const _MiniCard({
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(
                  '$value',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BarChart extends StatelessWidget {
  final int planned;
  final int playing;
  final int completed;
  final int total;

  const _BarChart({
    required this.planned,
    required this.playing,
    required this.completed,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final maxValue = [planned, playing, completed, 1].reduce((a, b) => a > b ? a : b).toDouble();

    Widget bar(String label, int value, Color color) {
      final widthFactor = value / maxValue;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            SizedBox(width: 90, child: Text(label)),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: widthFactor,
                    child: Container(
                      height: 16,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text('$value'),
          ],
        ),
      );
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Распределение статусов',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            bar('Запланировано', planned, Colors.orange.shade300),
            bar('Играю', playing, Colors.blue.shade300),
            bar('Пройдено', completed, Colors.green.shade300),
            const Divider(height: 24),
            Text(
              'Всего игр: $total',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
