import 'package:flutter/material.dart';
import '../components/bottom_text.dart';
import '../components/button.dart';
import '../components/input_field.dart';
import '../components/chev_back_button.dart';
import '../style/fonts.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(22.0, 56.0, 22.0, 27.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ChevBackButton(),
            const SizedBox(height: 24.0),
            Text(
              "Forgot Password?",
              style: Fonts.heading,
            ),
            const SizedBox(height: 24.0),
            Text(
              "Don't worry! It occurs. Please enter the email address linked with your account.",
              style: Fonts.medText,
            ),
            const SizedBox(height: 16.0),
            InputField(
                inputText: "Email*",
                hintText: "Enter your email",
                controller: email),
            const SizedBox(height: 24.0),
            Button(onPressed: () {}, buttonText: "Send Code"),
            const Spacer(),
            const BottomText(
              text: 'Remember Password?',
              buttonText: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}
