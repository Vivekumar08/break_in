import 'package:flutter/material.dart';
import 'constants.dart';
import '../onboarding/onboarding.dart';
import '../login/Login.dart';
import '../login/login_with_phone.dart';
import '../login/forgotPasswd.dart';
import '../login/new_password.dart';
import '../login/passwordChanged.dart';
import '../login/register_with_mail.dart';
import '../login/register_with_phone.dart';
import '../location/detected_location.dart';
import '../location/detecting_location.dart';
import '../location/manual_location.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case root:
        return MaterialPageRoute(builder: (_) => const Onboarding());
      case loginWithEmail:
        return MaterialPageRoute(builder: (_) => const Login());
      case loginWithPhone:
        return MaterialPageRoute(builder: (_) => const LoginWithPhone());
      case forgotPasswd:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case newPasswd:
        return MaterialPageRoute(builder: (_) => const NewPassword());
      case passwdChanged:
        return MaterialPageRoute(builder: (_) => const PasswordChanged());
      case registerWithPhone:
        return MaterialPageRoute(builder: (_) => const RegiterWithPhone());
      case registerWithMail:
        return MaterialPageRoute(builder: (_) => const RegisterWithMail());
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
