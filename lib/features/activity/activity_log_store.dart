import 'package:mobx/mobx.dart';
import 'models/log_entry.dart';

part 'activity_log_store.g.dart';

class ActivityLogStore = _ActivityLogStore with _$ActivityLogStore;

abstract class _ActivityLogStore with Store {
  @observable
  ObservableList<LogEntry> entries = ObservableList.of([]);

  @action
  void logAction(String message, {String category = 'general'}) {
    final entry = LogEntry(
      message: message,
      timestamp: DateTime.now(),
      category: category,
    );

    entries.insert(0, entry);
  }
}
