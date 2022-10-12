import 'package:flutter/material.dart';
import 'package:wordle/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:wordle/theme/theme_preferences.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.maybePop(context);
            },
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
      body: Column(
        children: [
          Consumer<ThemeProvider>(
            builder: (_, notifier, __) {
              bool isSwitched = false;
              isSwitched = notifier.isDark;
              return SwitchListTile(
                value: isSwitched,
                onChanged: (value) {
                  ThemePreferences.saveTheme(isDark: isSwitched);
                  Provider.of<ThemeProvider>(context, listen: false)
                      .setTheme(turnOn: isSwitched);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
