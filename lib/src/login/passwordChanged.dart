import 'package:flutter/material.dart';
import '../components/button.dart';
import '../utils/images.dart';
import '../style/fonts.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

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
                Images.successMark,
                Padding(
                  padding: const EdgeInsets.only(top: 11),
                  child: Text("Password Changed", style: Fonts.title),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                  child: Text(
                    "Your password has been changed\nsuccessfully.",
                    style: Fonts.medText,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22.0, 0.0, 22.0, 27.0),
            child: Button(buttonText: "Back to Login", onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
