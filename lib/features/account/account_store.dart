import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../activity/activity_log_store.dart';
import 'models/user.dart';

part 'account_store.g.dart';

class AccountStore = _AccountStore with _$AccountStore;

abstract class _AccountStore with Store {
  final logStore = GetIt.I<ActivityLogStore>();

  @observable
  String loginIdentifier = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String username = '';

  @observable
  User? currentUser;

  @observable
  bool isAuthorized = false;

  @computed
  bool get isLoggedIn => currentUser != null;

  @computed
  bool get canLogin => loginIdentifier.isNotEmpty && password.isNotEmpty;

  @computed
  bool get canRegister =>
      email.isNotEmpty && username.isNotEmpty && password.isNotEmpty;

  @action
  void setLoginIdentifier(String value) => loginIdentifier = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setUsername(String value) => username = value;

  @action
  void login() {
    if (!canLogin) return;

    final id = loginIdentifier.trim();
    final loginIsEmail = id.contains('@');
    final resolvedEmail = loginIsEmail
        ? id
        : (email.isNotEmpty ? email : '$id@local');
    final resolvedUsername = username.isNotEmpty
        ? username
        : (loginIsEmail ? id.split('@').first : id);

    currentUser = User(
      email: resolvedEmail,
      username: resolvedUsername,
    );
    isAuthorized = true;

    logStore.logAction('Вход выполнен для $id', category: 'account');
  }

  @action
  void register() {
    if (!canRegister) return;

    currentUser = User(email: email, username: username);
    isAuthorized = true;
    loginIdentifier = email;

    logStore.logAction('Регистрация пользователя $email', category: 'account');
  }

  @action
  void logout() {
    logStore.logAction('Выход пользователя ${currentUser?.email ?? ''}', category: 'account');
    currentUser = null;
    isAuthorized = false;
  }
}
