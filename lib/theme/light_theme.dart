import 'package:flutter/material.dart';

final lightColorScheme = ColorScheme.fromSeed(seedColor: Colors.cyanAccent);
final defaultLightTheme = ThemeData.light();
final lightTheme = defaultLightTheme.copyWith(
  colorScheme: lightColorScheme,
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: lightColorScheme.onPrimaryContainer,
    foregroundColor: lightColorScheme.primaryContainer,
  ),
  cardTheme: defaultLightTheme.cardTheme.copyWith(
    color: lightColorScheme.onPrimary,
  ),
);
