import 'package:flutter/material.dart';
import 'constants.dart';
import '../onboarding/onboarding.dart';
import '../login/Login.dart';
import '../login/forgotPasswd.dart';
import '../login/passwordChanged.dart';

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
