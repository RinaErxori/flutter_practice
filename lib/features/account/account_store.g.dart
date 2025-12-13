// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccountStore on _AccountStore, Store {
  Computed<bool>? _$isLoggedInComputed;

  @override
  bool get isLoggedIn => (_$isLoggedInComputed ??= Computed<bool>(
    () => super.isLoggedIn,
    name: '_AccountStore.isLoggedIn',
  )).value;
  Computed<bool>? _$canLoginComputed;

  @override
  bool get canLogin => (_$canLoginComputed ??= Computed<bool>(
    () => super.canLogin,
    name: '_AccountStore.canLogin',
  )).value;
  Computed<bool>? _$canRegisterComputed;

  @override
  bool get canRegister => (_$canRegisterComputed ??= Computed<bool>(
    () => super.canRegister,
    name: '_AccountStore.canRegister',
  )).value;

  late final _$loginIdentifierAtom = Atom(
    name: '_AccountStore.loginIdentifier',
    context: context,
  );

  @override
  String get loginIdentifier {
    _$loginIdentifierAtom.reportRead();
    return super.loginIdentifier;
  }

  @override
  set loginIdentifier(String value) {
    _$loginIdentifierAtom.reportWrite(value, super.loginIdentifier, () {
      super.loginIdentifier = value;
    });
  }

  late final _$emailAtom = Atom(name: '_AccountStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom = Atom(
    name: '_AccountStore.password',
    context: context,
  );

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$usernameAtom = Atom(
    name: '_AccountStore.username',
    context: context,
  );

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$currentUserAtom = Atom(
    name: '_AccountStore.currentUser',
    context: context,
  );

  @override
  User? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$isAuthorizedAtom = Atom(
    name: '_AccountStore.isAuthorized',
    context: context,
  );

  @override
  bool get isAuthorized {
    _$isAuthorizedAtom.reportRead();
    return super.isAuthorized;
  }

  @override
  set isAuthorized(bool value) {
    _$isAuthorizedAtom.reportWrite(value, super.isAuthorized, () {
      super.isAuthorized = value;
    });
  }

  late final _$_AccountStoreActionController = ActionController(
    name: '_AccountStore',
    context: context,
  );

  @override
  void setLoginIdentifier(String value) {
    final _$actionInfo = _$_AccountStoreActionController.startAction(
      name: '_AccountStore.setLoginIdentifier',
    );
    try {
      return super.setLoginIdentifier(value);
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_AccountStoreActionController.startAction(
      name: '_AccountStore.setEmail',
    );
    try {
      return super.setEmail(value);
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_AccountStoreActionController.startAction(
      name: '_AccountStore.setPassword',
    );
    try {
      return super.setPassword(value);
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_AccountStoreActionController.startAction(
      name: '_AccountStore.setUsername',
    );
    try {
      return super.setUsername(value);
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void login() {
    final _$actionInfo = _$_AccountStoreActionController.startAction(
      name: '_AccountStore.login',
    );
    try {
      return super.login();
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void register() {
    final _$actionInfo = _$_AccountStoreActionController.startAction(
      name: '_AccountStore.register',
    );
    try {
      return super.register();
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logout() {
    final _$actionInfo = _$_AccountStoreActionController.startAction(
      name: '_AccountStore.logout',
    );
    try {
      return super.logout();
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loginIdentifier: ${loginIdentifier},
email: ${email},
password: ${password},
username: ${username},
currentUser: ${currentUser},
isAuthorized: ${isAuthorized},
isLoggedIn: ${isLoggedIn},
canLogin: ${canLogin},
canRegister: ${canRegister}
    ''';
  }
}
