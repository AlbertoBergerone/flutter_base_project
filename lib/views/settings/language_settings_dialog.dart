import 'package:flutter/material.dart';
import 'package:flutter_base_project/providers/locale_provider.dart';
import 'package:flutter_base_project/views/settings/settings_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_base_project/l10n/gen_l10n/app_localizations.dart';

/// New language selection dialog
class LanguageSettingsDialog extends StatefulWidget {
  const LanguageSettingsDialog({super.key});

  @override
  State<LanguageSettingsDialog> createState() => _LanguageSettingsDialogState();
}

class _LanguageSettingsDialogState extends State<LanguageSettingsDialog> {
  late final localeProvider = Provider.of<LocaleProvider>(context, listen: false);
  late final l10n = AppLocalizations.of(context);
  List<SettingsItem> supportedLanguages = [];


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Check added because after the locale is changed, this function is called
    // another time and there will be a moment in which the options are displayed
    // in the new language
    if (supportedLanguages.isEmpty) {
      for (var locale in localeProvider.supportedAppLocales) {
        supportedLanguages.add(
            SettingsItem(name: locale.name(context), value: locale.locale));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    // Sorting the languages by name
    supportedLanguages.sort((a, b) => a.name.compareTo(b.name));

    return Dialog(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: supportedLanguages.length,
        itemBuilder: (context, index) {
          final SettingsItem language = supportedLanguages[index];

          return ListTile(
            title: Text(language.name),
            trailing: language.value.languageCode == localeProvider.currentLocale.id
                ? const Icon(Icons.check) // Current language
                : null,
            onTap: () {
              localeProvider.setLocale(language.value);
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }
}