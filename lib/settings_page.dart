import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:restart_app/restart_app.dart';

class MySettingsPage extends StatefulWidget {
  const MySettingsPage({Key? key}) : super(key: key);

  @override
  _MySettingsPageState createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<MySettingsPage> {
  // dynamic myThemeMode;
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadDarkModeValue();
  }

  void _loadDarkModeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = (prefs.getBool('isDarkMode') ?? false);
    });
  }

  void setDarkModeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkMode);
    Restart.restartApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Settings',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: SettingsList(backgroundColor: Colors.grey[850], sections: [
        SettingsSection(
          titlePadding: const EdgeInsets.only(
            top: 10.0,
            left: 20.0,
          ),
          title: 'General',
          tiles: [
            const SettingsTile(
              title: 'Language',
              subtitle: 'English',
              leading: Icon(Icons.language_rounded),
            ),
            SettingsTile.switchTile(
              title: 'Dark Mode (Restarts App)',
              leading: const Icon(Icons.phone_android),
              switchValue: _isDarkMode,
              onToggle: (value) {
                setState(() {
                  _isDarkMode = value;
                  setDarkModeValue();
                });
              },
            ),
          ],
        )
      ]),
    );
  }
}
