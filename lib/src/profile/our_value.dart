import 'package:flutter/material.dart';
import '../style/fonts.dart';

class OurValue extends StatelessWidget {
  const OurValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text("Our Value", style: Fonts.appBarTitle),
      ),
    );
  }
}
