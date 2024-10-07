import 'package:flutter/material.dart';
import 'package:flutter_base_project/l10n/gen_l10n/app_localizations.dart';

/// Useful for tracing a theme by id (saved in the preferences)
class AppTheme {
  final String id;
  final String Function(BuildContext) name;
  final ThemeData theme;

  AppTheme({
    required this.id,
    required this.name,
    required this.theme,
  });
}

/// Base theme
final ThemeData baseTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  textTheme: const TextTheme(
    // Aggiungi qui le definizioni del testo se necessario
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
  ),
);

final List<AppTheme> availableThemes = [
  AppTheme(
    id: 'customTheme1',
    name: (context) => AppLocalizations.of(context).theme_1_name,
    theme: baseTheme.copyWith(
      primaryColor: Colors.green,
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: Colors.green,
        secondary: Colors.greenAccent,
      ),
      appBarTheme: baseTheme.appBarTheme.copyWith(
        backgroundColor: Colors.green,
      ),
      floatingActionButtonTheme: baseTheme.floatingActionButtonTheme.copyWith(
        backgroundColor: Colors.green,
      ),
    ),
  ),
  AppTheme(
    id: 'customTheme2',
    name: (context) => AppLocalizations.of(context).theme_2_name,
    theme: baseTheme.copyWith(
      primaryColor: Colors.orange,
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: Colors.orange,
        secondary: Colors.orangeAccent,
      ),
      appBarTheme: baseTheme.appBarTheme.copyWith(
        backgroundColor: Colors.orange,
      ),
      floatingActionButtonTheme: baseTheme.floatingActionButtonTheme.copyWith(
        backgroundColor: Colors.orange,
      ),
    ),
  ),
];
