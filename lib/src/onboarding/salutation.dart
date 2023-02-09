import 'package:flutter/material.dart';
import '../components/button.dart';
import '../utils/images.dart';
import '../style/fonts.dart';

class Salutation extends StatelessWidget {
  const Salutation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 2, child: Container()),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Images.hello,
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Text("John", style: Fonts.title),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
