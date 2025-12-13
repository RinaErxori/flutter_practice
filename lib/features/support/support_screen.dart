import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'support_store.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I<SupportStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Поддержка и помощь'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Observer(
          builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Тема'),
                  onChanged: store.setSubject,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Сообщение'),
                  minLines: 3,
                  maxLines: 5,
                  onChanged: store.setMessage,
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: store.isSending ? null : () => store.sendFeedback(),
                  child: store.isSending
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Отправить'),
                ),
                const SizedBox(height: 12),
                if (store.isSent)
                  Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green),
                      const SizedBox(width: 8),
                      Text(
                        'Сообщение отправлено',
                        style: TextStyle(color: Colors.green.shade700),
                      ),
                    ],
                  ),
                const SizedBox(height: 12),
                const Text(
                  'О приложении',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                const Text('Game notes helper • версия 1.0.0'),
              ],
            );
          },
        ),
      ),
    );
  }
}
