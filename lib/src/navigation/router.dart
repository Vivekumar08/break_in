import 'package:break_in/src/login/forgotPasswd.dart';
import 'package:break_in/src/login/passwordChanged.dart';
import 'package:break_in/src/navigation/constants.dart';
import 'package:flutter/material.dart';
import '../onboarding/onboarding.dart';
import '../login/Login.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case root:
        return MaterialPageRoute(builder: (_) => const Onboarding());
      case login:
        return MaterialPageRoute(builder: (_) => const Login());
      case passwdChanged:
        return MaterialPageRoute(builder: (_) => const PasswordChanged());
      case forgotPasswd:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
