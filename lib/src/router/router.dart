import 'package:go_router/go_router.dart';
import 'constants.dart';
import '../login/login_with_phone.dart';
import '../login/new_password.dart';
import '../login/login_with_mail.dart';
import '../login/forgot_passwd.dart';
import '../login/passwordChanged.dart';
import '../login/register_with_mail.dart';
import '../login/register_with_phone.dart';
import '../login/otp_with_mail.dart';
import '../login/otp_with_phone.dart';
import '../login/register_with_otp.dart';
import '../onboarding/onboarding.dart';
import '../onboarding/salutation.dart';
import '../location/detected_location.dart';
import '../home/home.dart';

final router = GoRouter(
  initialLocation: root,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Onboarding(),
      routes: [
        GoRoute(
          path: 'loginWithMail',
          builder: (context, state) => const LoginWithMail(),
          routes: [
            GoRoute(
              path: 'forgotPassword',
              builder: (context, state) => const ForgotPassword(),
              routes: [
                GoRoute(
                  path: 'otpWithMail',
                  builder: (context, state) => const OTPWithMail(),
                ),
                GoRoute(
                  path: 'newPassword',
                  builder: (context, state) => const NewPassword(),
                ),
              ],
            ),
            GoRoute(
              path: 'passwdChanged',
              builder: (context, state) => const PasswordChanged(),
            ),
            GoRoute(
              path: 'registerWithMail',
              builder: (context, state) => const RegisterWithMail(),
            ),
          ],
        ),
        GoRoute(
          path: 'loginWithPhone',
          builder: (context, state) => const LoginWithPhone(),
          routes: [
            GoRoute(
              path: 'otpWithPhone',
              builder: (context, state) => const OTPWithPhone(),
            ),
            GoRoute(
              path: 'registerWithPhone',
              builder: (context, state) => const RegisterWithPhone(),
              routes: [
                GoRoute(
                  path: "registerWithOtp",
                  builder: (context, state) => const RegisterWithOTP(),
                )
              ],
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: '/detectedLocation',
      builder: (context, state) => const DetectedLocation(),
    ),

    // Salutation
    GoRoute(
      path: '/salutation',
      builder: (context, state) => const Salutation(),
    ),

    // Home
    GoRoute(
      path: '/home',
      builder: (context, state) => const Home(),
    ),
  ],
);
