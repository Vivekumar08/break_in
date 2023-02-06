import 'package:flutter/material.dart';
import '../onboarding/onboarding.dart';
import '../login/Login.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Onboarding());
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
