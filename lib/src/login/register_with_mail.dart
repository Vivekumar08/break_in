import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/input_field.dart';
import '../style/fonts.dart';
import '../components/chev_back_button.dart';

class RegiterWithMail extends StatelessWidget {
  const RegiterWithMail({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                const SizedBox(height: 24.0),
                Text(
                  "Hello! Register to get\nstarted",
                  style: Fonts.heading,
                ),
                const SizedBox(height: 16.0),
                InputField(
                    inputText: "Full Name*",
                    hintText: "Enter your full name",
                    controller: name),
                InputField(
                    inputText: "Email*",
                    hintText: "Enter your email",
                    controller: phone),
                InputField(
                    inputText: "New Password*",
                    hintText: "Enter new password",
                    controller: phone),
                InputField(
                    inputText: "Confirm New Password*",
                    hintText: "Enter new password",
                    controller: phone),
                const SizedBox(height: 16.0),
                Button(onPressed: () {}, buttonText: "Register"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
