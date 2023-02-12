import 'package:break_in/src/style/fonts.dart';
import 'package:flutter/material.dart';

class OurStory extends StatelessWidget {
  const OurStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text("Our Story", style: Fonts.appBarTitle),
      ),
    );
  }
}
