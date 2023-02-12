import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../router/constants.dart';
import '../style/fonts.dart';
import '../style/palette.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});
  Widget _aboutUsCategories(String text, BuildContext context, String route) =>
      ListTile(
        title:
            Text(text, style: Fonts.buttonText.copyWith(color: Palette.text)),
        contentPadding: EdgeInsets.zero,
        horizontalTitleGap: 0,
        dense: true,
        trailing: const Icon(
          Icons.chevron_right,
          size: 32,
        ),
        shape: text != "Our Team"
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: Palette.greyNormal))
            : null,
        onTap: () => context.go(route),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text("About Us", style: Fonts.appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _aboutUsCategories("Our Story", context, ourStory),
            _aboutUsCategories("Our Values", context, ourValue),
            _aboutUsCategories("Our Mission", context, ourMission),
            _aboutUsCategories("Our Team", context, ourTeam),
          ],
        ),
      ),
    );
  }
}
