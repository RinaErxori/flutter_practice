import 'package:flutter/widgets.dart';
import 'game_service.dart';

class GameScope extends StatefulWidget {
  final Widget child;

  const GameScope({super.key, required this.child});

  @override
  State<GameScope> createState() => _GameScopeState();

  static GameScopeInherited of(BuildContext context) {
    final inherited =
    context.dependOnInheritedWidgetOfExactType<GameScopeInherited>();
    assert(inherited != null, 'В контексте GameScope не найден');
    return inherited!;
  }

  static GameScopeInherited read(BuildContext context) {
    final inherited =
    context.getElementForInheritedWidgetOfExactType<GameScopeInherited>()?.widget
    as GameScopeInherited?;
    assert(inherited != null, 'В контексте GameScope не найден');
    return inherited!;
  }
}

class _GameScopeState extends State<GameScope> {
  final GameService repository = GameService();

  void notify() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return GameScopeInherited(
      state: this,
      child: widget.child,
    );
  }
}

class GameScopeInherited extends InheritedWidget {
  final _GameScopeState state;

  const GameScopeInherited({
    super.key,
    required this.state,
    required super.child,
  });

  GameService get repository => state.repository;

  @override
  bool updateShouldNotify(GameScopeInherited oldWidget) => true;
}






