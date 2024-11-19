import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_base_project/src/domain/services/settings_service.dart';
import 'package:flutter_base_project/src/core/theme/app_theme.dart';

/// Theme Provider
class ThemeProvider with ChangeNotifier {
  late AppTheme _currentTheme;

  ThemeProvider() {
    _loadTheme(); // Initialize theme from preferences
  }

  /// Get current app theme
  AppTheme get currentTheme => _currentTheme;

  /// Get system brightness
  Brightness get systemBrightness => SchedulerBinding.instance.platformDispatcher.platformBrightness;

  void switchTheme(AppTheme newTheme) {
    _currentTheme = newTheme;
    SettingsService.setTheme(newTheme.id);
    notifyListeners();
  }

  /// Initialize app theme with preferences (or matching system brightness)
  void _loadTheme() {
    String? savedThemeId = SettingsService.getTheme();
    // Looking for theme saved in preferences
    _currentTheme = availableThemes.firstWhere(
      (theme) => theme.id == savedThemeId,
      orElse: () => availableThemes.firstWhere(
        // If no theme is found, take the first one with the same brightness
        (theme) => theme.theme.brightness == systemBrightness,
        orElse: () => availableThemes.first) // first theme if there are no matches
    );
    notifyListeners();
  }
}
