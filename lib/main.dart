import 'package:flutter/material.dart';
import 'package:hackradar/screens/homepage.dart';
import 'package:hackradar/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HackRadar',
      home: const Homepage(),
      theme: appTheme,
    );
  }
}
