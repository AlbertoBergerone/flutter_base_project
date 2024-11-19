import 'package:flutter/material.dart';
import 'package:flutter_base_project/src/presentation/pages/home.dart';
import 'package:flutter_base_project/l10n/gen_l10n/app_localizations.dart';
import 'package:flutter_base_project/src/core/providers/locale_provider.dart';
import 'package:flutter_base_project/src/core/providers/theme_provider.dart';
import 'package:flutter_base_project/src/core/utils/shared_prefs.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  // Make sure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefs.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      title: 'My app name',
      theme: themeProvider.currentTheme.theme,
      darkTheme: themeProvider.currentTheme.theme,
      home: const MyHomePage(),
      locale: localeProvider.currentLocale.locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: localeProvider.supportedLocales,
    );
  }
}