import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../components/auth_options.dart';
import '../../components/button.dart';
import '../../components/input_field.dart';
import '../../providers/providers.dart';
import '../../router/constants.dart';
import '../../style/fonts.dart';

class RegisterWithMail extends StatefulWidget {
  const RegisterWithMail({super.key});

  @override
  State<RegisterWithMail> createState() => _RegisterWithMailState();
}

class _RegisterWithMailState extends State<RegisterWithMail> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passwd = TextEditingController();
  TextEditingController confirmPasswd = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    passwd.dispose();
    confirmPasswd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(22.0, 56.0, 22.0, 27.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Row(children: const [ChevBackButton(), Spacer()]),
            const SizedBox(height: 24.0),
            Text(
              "Hello! Register to get started",
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
            PasswordField(
                inputText: "New Password*",
                hintText: "Enter your password",
                controller: passwd),
            PasswordField(
                inputText: "Confirm New Password*",
                hintText: "Enter your password",
                controller: confirmPasswd),
            const SizedBox(height: 24.0),
            Button(
                onPressed: () async {
                  Provider.of<AuthProvider>(context).registerWithMail(
                    name: name.text,
                    email: email.text,
                    password: passwd.text,
                  );
                  context.go(salutation);
                },
                buttonText: "Register"),
            AuthOptions(
              emailAuth: false,
              text: "Or Register with",
              onTapWithPhone: () => context.pushReplacement(registerWithPhone),
            ),
            const SizedBox(height: 30),
            BottomTextButton(
              text: 'Already have an account?',
              buttonText: 'Login',
              onTap: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}
