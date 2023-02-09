import 'package:flutter/material.dart';
import 'constants.dart';
import '../login/login_with_phone.dart';
import '../login/new_password.dart';
import '../login/login_with_mail.dart';
import '../login/forgotPasswd.dart';
import '../login/passwordChanged.dart';
import '../login/register_with_mail.dart';
import '../login/register_with_phone.dart';
import '../onboarding/onboarding.dart';
import '../onboarding/salutation.dart';
import '../location/detected_location.dart';
import '../location/detecting_location.dart';
import '../location/manual_location.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case root:
        return MaterialPageRoute(builder: (_) => const Onboarding());
      case loginWithMail:
        return MaterialPageRoute(builder: (_) => const LoginWithMail());
      case loginWithPhone:
        return MaterialPageRoute(builder: (_) => const LoginWithPhone());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case newPassword:
        return MaterialPageRoute(builder: (_) => const NewPassword());
      case passwdChanged:
        return MaterialPageRoute(builder: (_) => const PasswordChanged());
      case registerWithPhone:
        return MaterialPageRoute(builder: (_) => const RegiterWithPhone());
      case registerWithMail:
        return MaterialPageRoute(builder: (_) => const RegisterWithMail());
      case salutation:
        return MaterialPageRoute(builder: (_) => const Salutation());
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
