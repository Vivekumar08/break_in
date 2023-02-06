// ignore: file_names
import 'package:break_in/src/components/button.dart';
import 'package:break_in/src/components/input_field.dart';
import 'package:break_in/src/style/fonts.dart';

import '/src/components/chev_back_button.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController passwd = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 56),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ChevBackButton(),
                const SizedBox(height: 24),
                Text(
                  "Welcome back! Glad\nto see you, Again!",
                  style: Fonts.title,
                ),
                InputField(
                    inputText: "Email*",
                    hintText: "Enter your email",
                    controller: email),
                InputField(
                    inputText: "Password*",
                    hintText: "Enter your password",
                    controller: passwd),
                Button(onPressed: () {}, buttonText: "Login")
              ],
            ),
            // ),
            // Expanded(child: Container())
          ],
        ),
      ),
    );
  }
}
