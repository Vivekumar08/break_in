import 'package:flutter/material.dart';
import '../components/auth_options.dart';
import '../components/bottom_text.dart';
import '../components/button.dart';
import '../components/input_field.dart';
import '../style/fonts.dart';
import '../components/chev_back_button.dart';

class RegiterWithPhone extends StatelessWidget {
  const RegiterWithPhone({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();

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
              "Hello! Register to get\nstarted",
              style: Fonts.heading,
            ),
            const SizedBox(height: 16.0),
            InputField(
                inputText: "Full Name*",
                hintText: "Enter your full name",
                controller: name),
            InputField(
                inputText: "Phone Number*",
                hintText: "Enter your phone number",
                controller: phone),
            const SizedBox(height: 24.0),
            Button(onPressed: () {}, buttonText: "Send OTP"),
            const AuthOptions(emailAuth: true, text: "Or Register with"),
            const Spacer(),
            const BottomText(
              text: 'Don’t have an account?',
              buttonText: 'Register Now',
            ),
          ],
        ),
      ),
    );
  }
}
