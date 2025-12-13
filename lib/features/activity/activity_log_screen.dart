import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'activity_log_store.dart';

class ActivityLogScreen extends StatelessWidget {
  const ActivityLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = GetIt.I<ActivityLogStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Журнал действий'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Observer(
        builder: (_) {
          if (store.entries.isEmpty) {
            return const Center(child: Text('Журнал пуст'));
          }

          return ListView.builder(
            itemCount: store.entries.length,
            itemBuilder: (_, i) {
              final entry = store.entries[i];

              return ListTile(
                leading: const Icon(Icons.history),
                title: Text(entry.message),
                subtitle: Text(
                    '${entry.category} · ${entry.timestamp.toLocal().toString().split(".").first}'),
              );
            },
          );
        },
      ),
    );
  }
}
