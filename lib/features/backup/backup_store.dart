import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../activity/activity_log_store.dart';

part 'backup_store.g.dart';

class BackupStore = _BackupStore with _$BackupStore;

abstract class _BackupStore with Store {
  final logStore = GetIt.I<ActivityLogStore>();

  @observable
  bool isExporting = false;

  @observable
  bool isImporting = false;

  @observable
  String statusMessage = '';

  @action
  Future<void> exportData() async {
    if (isExporting) return;

    isExporting = true;
    statusMessage = 'Экспортируем данные...';
    await Future.delayed(const Duration(milliseconds: 500));
    statusMessage = 'Экспорт завершён';
    isExporting = false;

    logStore.logAction('Экспорт данных выполнен', category: 'backup');
  }

  @action
  Future<void> importData() async {
    if (isImporting) return;

    isImporting = true;
    statusMessage = 'Импортируем данные...';
    await Future.delayed(const Duration(milliseconds: 500));
    statusMessage = 'Импорт завершён';
    isImporting = false;

    logStore.logAction('Импорт данных выполнен', category: 'backup');
  }
}
