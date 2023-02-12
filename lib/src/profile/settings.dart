import 'package:break_in/src/style/fonts.dart';
import 'package:break_in/src/style/palette.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  Widget _settingsCategories(String text, VoidCallback onPressed) => 
  Padding(
    padding: const EdgeInsets.symmetric(horizontal:22.0),
    child:ListTile(
        title: Text(text, style: Fonts.poppins),
        horizontalTitleGap: 0,
        dense: true,
        trailing: const Icon(
          Icons.chevron_right,
          size: 32,
        ),
        shape: UnderlineInputBorder(
          borderSide: BorderSide(color: Palette.greyNormal),
        ),
      ),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text("Settings", style: Fonts.appBarTitle),
      ),
      body: Column(
        children: [_settingsCategories("Logout", () {})],
      ),
    );
  }
}
