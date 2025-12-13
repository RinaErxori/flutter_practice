import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'backup_store.dart';

class BackupScreen extends StatelessWidget {
  const BackupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I<BackupStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Экспорт и импорт'),
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
                ElevatedButton.icon(
                  onPressed: store.isExporting ? null : () => store.exportData(),
                  icon: const Icon(Icons.upload),
                  label: const Text('Экспортировать заметки'),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: store.isImporting ? null : () => store.importData(),
                  icon: const Icon(Icons.download),
                  label: const Text('Импортировать заметки'),
                ),
                const SizedBox(height: 12),
                Text(
                  store.statusMessage.isEmpty
                      ? 'Операции ещё не выполнялись'
                      : store.statusMessage,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
