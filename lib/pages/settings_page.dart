import 'package:flutter/material.dart';
import 'package:wordle/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:wordle/theme/theme_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
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
          SwitchListTile(
            value: _isSwitched,
            onChanged: (value) {
              setState(() {
                _isSwitched = value;
              });
              ThemePreferences.saveTheme(isDark: _isSwitched);
              Provider.of<ThemeProvider>(context, listen: false)
                  .setTheme(turnOn: _isSwitched);
            },
          )
        ],
      ),
    );
  }
}
