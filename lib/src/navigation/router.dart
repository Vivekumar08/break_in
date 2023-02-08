import 'package:break_in/src/location/detected_location.dart';
import 'package:break_in/src/location/detecting_location.dart';
import 'package:break_in/src/location/manually_location.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import '../onboarding/onboarding.dart';
import '../login/Login.dart';
import '../login/forgotPasswd.dart';
import '../login/passwordChanged.dart';
import '../login/register_with_mail.dart';
import '../login/register_with_phone.dart';

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
      case registerWithMail:
        return MaterialPageRoute(builder: (_) => const RegiterWithMail());
      case registerWithPhone:
        return MaterialPageRoute(builder: (_) => const RegiterWithPhone());
      case detectingLocation:
        return MaterialPageRoute(builder: (_) => const DetectingLocation());
      case detectedLocation:
        return MaterialPageRoute(builder: (_) => const DetectedLocation());
      case manualLocation:
        return MaterialPageRoute(builder: (_) => const ManualLocation());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
