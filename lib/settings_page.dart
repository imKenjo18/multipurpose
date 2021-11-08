import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class MySettingsPage extends StatefulWidget {
  const MySettingsPage({ Key? key }) : super(key: key);

  @override
  _MySettingsPageState createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<MySettingsPage> {
  bool isDarkMode = true;

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
        )
      ),
      body: SettingsList(
        backgroundColor: Colors.grey[850],
        sections: [
          SettingsSection(
            // titlePadding: EdgeInsets.all(20.0),
            title: 'General',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language_rounded),
              ),
              SettingsTile.switchTile(
                title: 'Dark Mode',
                leading: Icon(Icons.phone_android),
                switchValue: isDarkMode,
                onToggle: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              ),
            ],
          )
        ]
      ),
    );
  }
}