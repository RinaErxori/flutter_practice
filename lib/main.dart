import 'package:flutter/material.dart';
import 'features/games/screens/GameListScreen.dart';

void main() {
  runApp(const GameTrackerApp());
}

class GameTrackerApp extends StatelessWidget {
  const GameTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '5 практика',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const GameListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}