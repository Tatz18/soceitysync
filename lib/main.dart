import 'package:flutter/material.dart';
import './src/screens/home_screen.dart';
import '../src/config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SocietySync',
      theme: appTheme,
      home: const HomeScreen(),
    );
  }
}