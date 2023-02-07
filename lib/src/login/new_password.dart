import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/input_field.dart';
import '../style/fonts.dart';
import '../components/chev_back_button.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController Passwd = TextEditingController();
    TextEditingController confirmPasswd = TextEditingController();

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
                    inputText: "New Password*",
                    hintText: "Enter new password",
                    controller: Passwd),
                const SizedBox(height: 16.0),
                InputField(
                    inputText: "Confirm New Password*",
                    hintText: "Enter confirm new password",
                    controller: confirmPasswd),
                const SizedBox(height: 24.0),
                Button(onPressed: () {}, buttonText: "Reset Password"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
