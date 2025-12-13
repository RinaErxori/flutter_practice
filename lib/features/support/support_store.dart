import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../activity/activity_log_store.dart';

part 'support_store.g.dart';

class SupportStore = _SupportStore with _$SupportStore;

abstract class _SupportStore with Store {
  final logStore = GetIt.I<ActivityLogStore>();

  @observable
  String subject = '';

  @observable
  String message = '';

  @observable
  bool isSent = false;

  @observable
  bool isSending = false;

  @action
  void setSubject(String value) => subject = value;

  @action
  void setMessage(String value) => message = value;

  @action
  Future<void> sendFeedback() async {
    if (subject.isEmpty || message.isEmpty) return;

    isSending = true;
    isSent = false;
    await Future.delayed(const Duration(milliseconds: 400));
    isSending = false;
    isSent = true;

    logStore.logAction('Отправлено обращение: $subject', category: 'support');
  }
}
