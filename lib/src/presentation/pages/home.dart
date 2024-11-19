import 'package:flutter/material.dart';
import 'package:flutter_base_project/l10n/gen_l10n/app_localizations.dart';
import 'package:flutter_base_project/views/settings/settings_page.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final l10n = AppLocalizations.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
              icon: const Icon(Icons.more_vert_outlined))
        ],
      ),
      body: Container()
    );
  }
}
