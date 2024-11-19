import 'package:flutter/material.dart';
import 'package:flutter_base_project/l10n/gen_l10n/app_localizations.dart';
import 'package:flutter_base_project/src/core/providers/theme_provider.dart';
import 'package:flutter_base_project/src/core/theme/app_theme.dart';
import 'package:flutter_base_project/src/presentation/widgets/settings/language_settings_dialog.dart';
import 'package:flutter_base_project/src/core/extensions/string_extensions.dart';
import 'package:flutter_base_project/src/presentation/widgets/settings/settings_dialog.dart';
import 'package:flutter_base_project/src/presentation/widgets/settings/settings_item.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late AppLocalizations l10n;
  late final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings.capitalize()),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSettingsItem(
              icon: Icons.translate,
              title: l10n.change_language,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => const LanguageSettingsDialog(),
                );
              },
            ),
            buildSettingsItem(
              icon: Icons.color_lens_outlined,
              title: l10n.change_theme,
              onTap: () {
                List<SettingsItem> items = [];
                for (AppTheme item in availableThemes) {
                  items.add(SettingsItem(name: item.name(context), value: item));
                }
                showDialog(
                  context: context,
                  builder: (_) => SettingsDialog(
                    settingsItems: items,
                    callback: (newTheme) => themeProvider.switchTheme(newTheme)),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildSettingsItem({
    required IconData icon,
    required String title,
    String subtitle = '',
    required GestureTapCallback onTap
  }) {
    return ListTile(
      title: Text(title.capitalize()),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
      leading: Icon(icon),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    );
  }
}