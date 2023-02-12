import 'package:flutter/material.dart';
import '../style/fonts.dart';

class OurTeam extends StatelessWidget {
  const OurTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text("Our Team", style: Fonts.appBarTitle),
      ),
    );
  }
}
