import 'package:flutter/material.dart';
import '../components/auth_options.dart';
import '../components/bottom_text.dart';
import '../components/button.dart';
import '../components/input_field.dart';
import '../style/fonts.dart';
import '../components/chev_back_button.dart';

class RegisterWithMail extends StatelessWidget {
  const RegisterWithMail({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController passwd = TextEditingController();
    TextEditingController confirmPasswd = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(22.0, 56.0, 22.0, 27.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Row(children: const [ChevBackButton(), Spacer()]),
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
                controller: email),
            InputField(
                inputText: "New Password*",
                hintText: "Enter new password",
                controller: passwd),
            InputField(
                inputText: "Confirm New Password*",
                hintText: "Enter new password",
                controller: confirmPasswd),
            const SizedBox(height: 24.0),
            Button(onPressed: () {}, buttonText: "Register"),
            const AuthOptions(emailAuth: false, text: "Or Register with"),
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
