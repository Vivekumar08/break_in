import 'package:flutter/material.dart';
import '../style/fonts.dart';

class OurMission extends StatelessWidget {
  const OurMission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text("Our Mission", style: Fonts.appBarTitle),
      ),
    );
  }
}