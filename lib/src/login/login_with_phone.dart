import 'package:break_in/src/components/auth_options.dart';
import 'package:flutter/material.dart';
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
                  "Welcome back! Glad\nto see you, Again!",
                  style: Fonts.heading,
                ),
                const SizedBox(height: 16.0),
                InputField(
                    inputText: "Phone Number*",
                    hintText: "Enter your phone number",
                    controller: phone),
                const SizedBox(height: 24.0),
                Button(onPressed: () {}, buttonText: "Send OTP"),
                const AuthOptions(emailAuth: true, text: "Or Login with")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
