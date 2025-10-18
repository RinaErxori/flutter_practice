import 'package:flutter/material.dart';
import 'screens/GameListScreen.dart';

void main() {
  runApp(GameTrackerApp());
}

class GameTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '5 практика',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GameListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
