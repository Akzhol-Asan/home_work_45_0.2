import 'package:flutter/material.dart';
import 'package:home_work_45_test/screens/main_screen.dart';
import 'package:home_work_45_test/theme/light_theme.dart';

class MoviesApp extends StatefulWidget {
  const MoviesApp({super.key});

  @override
  State<MoviesApp> createState() => _MoviesAppState();
}

class _MoviesAppState extends State<MoviesApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: lightTheme, home: MainScreen());
  }
}
