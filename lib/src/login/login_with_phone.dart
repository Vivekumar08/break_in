import 'package:flutter/material.dart';
import '../components/auth_options.dart';
import '../components/bottom_text.dart';
import '../components/button.dart';
import '../components/input_field.dart';
import '../style/fonts.dart';
import '../components/chev_back_button.dart';

class LoginWithPhone extends StatelessWidget {
  const LoginWithPhone({super.key});

  @override
  Widget build(BuildContext context) {
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
              "Welcome back! Glad\nto see you, Again!",
              style: Fonts.heading,
            ),
            const SizedBox(height: 16.0),
            InputField(
                inputText: "Phone*",
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
