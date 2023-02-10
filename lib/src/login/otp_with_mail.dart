import 'package:flutter/material.dart';
import '../components/otp_field.dart';
import '../components/auth_options.dart';
import '../components/bottom_text.dart';
import '../components/button.dart';
import '../components/chev_back_button.dart';
import '../style/fonts.dart';

class OTPWithEmail extends StatelessWidget {
  const OTPWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController otp = TextEditingController();
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
              "OTP Verification",
              style: Fonts.heading,
            ),
            const SizedBox(height: 10.0),
            Text(
              "Enter the verification code we just sent on your email address jhondoe@gmail.com",
              style: Fonts.medText,
            ),
            const SizedBox(height: 32.0),
            OtpField(length: 4, controller: otp),
            const SizedBox(height: 24.0),
            Button(onPressed: () {}, buttonText: "Verify"),
            const AuthOptions(emailAuth: true, text: "Or Register with"),
            const Spacer(),
            const BottomText(
              text: 'Didn\'t received code?',
              buttonText: 'Resend',
            ),
          ],
        ),
      ),
    );
  }
}
