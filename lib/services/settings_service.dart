import 'package:flutter_base_project/utils/shared_prefs.dart';

/// Settings preferences management
class SettingsService {
  static void setTheme(String theme) {
    SharedPrefs.setString('theme', theme);
  }

  static void setLocale(String locale) {
    SharedPrefs.setString('locale', locale);
  }

  static String? getTheme() {
    return SharedPrefs.getString('theme');
  }

  static String? getLocale() {
    return SharedPrefs.getString('locale');
  }
}