import 'package:break_in/src/style/fonts.dart';
import 'package:flutter/material.dart';

class OurValue extends StatelessWidget {
  const OurValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Icon(Icons.chevron_left, size: 32.0),
        ),
        title: Text("Our Value", style: Fonts.appBarTitle),
      ),
    );
  }
}
