import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_base_project/l10n/gen_l10n/app_localizations.dart';
import 'package:flutter_base_project/src/domain/services/settings_service.dart';

/// Locale management support class
class AppLocale {
  final String id;
  final String Function(BuildContext) name;
  final Locale locale;

  const AppLocale({
    required this.id,
    required this.name,
    required this.locale,
  });
}

/// Locale provider
class LocaleProvider with ChangeNotifier {
  late AppLocale _currentLocale;

  AppLocale get currentLocale => _currentLocale;

  List<AppLocale> supportedAppLocales = [
    AppLocale(
      id: 'en',
      name: (context) => AppLocalizations.of(context).english,
      locale: const Locale('en')),
    AppLocale(
        id: 'it',
        name: (context) => AppLocalizations.of(context).italian,
        locale: const Locale('it')),
    AppLocale(
        id: 'es',
        name: (context) => AppLocalizations.of(context).spanish,
        locale: const Locale('es')),
  ];


  /// List of supported locales (used for example in the main)
  List<Locale> get supportedLocales {
    List<Locale> locales = [];
    for (AppLocale item in supportedAppLocales) {
      locales.add(item.locale);
    }

    return locales;
  }

  /// Constructor
  LocaleProvider() {
    _loadLocale(); // Initialize app locale
  }

  /// Initialize locale based on preferences (or system)
  Future<void> _loadLocale() async {
    // TODO if a locale isn't supported it can be useful to check alternative locales
    // final List<Locale> systemLocales = WidgetsBinding.instance.window.locales;

    // If no locale is set in preferences, getting system locale
    String currentLocale = SettingsService.getLocale()?? Platform.localeName.split('_')[0];
    _currentLocale = supportedAppLocales.firstWhere(
          (AppLocale locale) => locale.id == currentLocale,
      orElse: () => supportedAppLocales.first,
    );
    notifyListeners();
  }

  /// Setting new locale
  void setLocale(Locale locale) {
    if (!AppLocalizations.supportedLocales.contains(locale)) return;
    _currentLocale = supportedAppLocales.firstWhere((item) => item.id == locale.languageCode);
    SettingsService.setLocale(locale.languageCode); // Adding locale to preferences
    notifyListeners();
  }
}