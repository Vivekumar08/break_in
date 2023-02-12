import 'package:break_in/src/style/fonts.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});
  Widget _aboutUsCategories(String text, VoidCallback onPressed) => ListTile(
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
        title: Text("About Us", style: Fonts.appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _aboutUsCategories("Our Story", () {}),
            _aboutUsCategories("Our Values", () {}),
            _aboutUsCategories("Our Mission", () {}),
            _aboutUsCategories("Our Team", () {}),
          ],
        ),
      ),
    );
  }
}
