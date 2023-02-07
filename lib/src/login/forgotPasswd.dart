import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/input_field.dart';
import '../style/fonts.dart';
import '../components/chev_back_button.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();

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
                const SizedBox(height: 24.0),
                Text(
                  "Forgot Password?",
                  style: Fonts.title,
                ),
                const SizedBox(height: 24.0),
                Text(
                  "Don't worry! It occurs. Please enter the email\naddress linked with your account.",
                  style: Fonts.medText,
                ),
                const SizedBox(height: 16.0),
                InputField(
                    inputText: "Email*",
                    hintText: "Enter your email",
                    controller: email),
                const SizedBox(height: 24.0),
                Button(onPressed: () {}, buttonText: "Verify"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
