import 'package:break_in/src/login/login_with_phone.dart';
import 'package:break_in/src/login/new_password.dart';
import 'package:break_in/src/onboarding/onboarding.dart';
import 'package:flutter/material.dart' hide Router;
import 'src/navigation/constants.dart';
import 'src/navigation/router.dart';
import 'src/style/palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Palette.background_2),
      debugShowCheckedModeBanner: true,
      onGenerateRoute: Router.generateRoute,
      initialRoute: root,
    );
  }
}
