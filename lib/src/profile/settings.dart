import 'package:break_in/src/style/fonts.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  Widget _settingsCategories(String text, VoidCallback onPressed) => ListTile(
        title: Text(text, style: Fonts.poppins),
        horizontalTitleGap: 0,
        dense: true,
        trailing: const Icon(
          Icons.chevron_right,
          size: 32,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Icon(Icons.chevron_left, size: 32.0),
        ),
        title: Text("Settings", style: Fonts.appBarTitle),
      ),
      body: Column(
        children: [_settingsCategories("Logout", () {})],
      ),
    );
  }
}
