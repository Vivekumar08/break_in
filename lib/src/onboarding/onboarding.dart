import 'package:break_in/src/components/button.dart';
import 'package:break_in/src/components/images.dart';
import 'package:break_in/src/style/fonts.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Images.onboarding,
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  child: Text("Discover food at work", style: Fonts.title),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                  child: Text(
                    "We make it simple to find the food at your work. Enter your address and let us do the rest.",
                    style: Fonts.simptext,
                    textAlign: TextAlign.center,
                  ),
                ),
                
              ],
            ),
          ),
          Expanded(child: Button(buttonText: "Next", onPressed: () {  },)),
        ],
      ),
    );
  }
}
