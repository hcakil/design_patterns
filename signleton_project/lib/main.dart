import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const NoteTakingApp());
}

class NoteTakingApp extends StatelessWidget {
  const NoteTakingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Taking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
