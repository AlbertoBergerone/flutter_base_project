import 'package:flutter/material.dart';
import 'package:flutter_base_project/extensions/string_extensions.dart';
import 'package:flutter_base_project/views/settings/settings_item.dart';

class SettingsDialog extends StatelessWidget {
  final List<SettingsItem> settingsItems;
  final Function callback;

  const SettingsDialog({
    super.key,
    required this.settingsItems,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: settingsItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(settingsItems[index].name.capitalize()),
            onTap: () {
              callback(settingsItems[index].value);
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }
}
