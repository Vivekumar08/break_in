import 'package:flutter/material.dart' hide Feedback;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../screens/home/categories.dart';
import '../screens/home/home.dart';
import '../screens/home/search.dart';
import '../screens/location/location_screen.dart';
import '../screens/onboarding/forgot_passwd.dart';
import '../screens/onboarding/login_with_mail.dart';
import '../screens/onboarding/login_with_phone.dart';
import '../screens/onboarding/new_password.dart';
import '../screens/onboarding/onboarding.dart';
import '../screens/onboarding/otp_with_mail.dart';
import '../screens/onboarding/otp_with_phone.dart';
import '../screens/onboarding/password_changed.dart';
import '../screens/onboarding/register_with_mail.dart';
import '../screens/onboarding/register_with_otp.dart';
import '../screens/onboarding/register_with_phone.dart';
import '../screens/onboarding/salutation.dart';
import '../screens/pages/canteen.dart';
import '../screens/pages/favourite.dart';
import '../screens/pages/menu.dart';
import '../screens/pages/rate.dart';
import '../screens/settings/feedback.dart';
import '../screens/settings/help_about.dart';
import '../screens/settings/edit_profile.dart';
import '../screens/settings/profile.dart';
import '../screens/settings/suggest_place.dart';
import '../screens/settings/about.dart';
import '../screens/settings/settings.dart';
import '../style/transitions.dart';
import 'constants.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Onboarding(),
      redirect: (context, GoRouterState state) async {
        bool token = await context.read<TokenProvider>().doesTokenExists();
        if (token) {
          return salutation;
        } else {
          return null;
        }
      },
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
      path: '/location',
      pageBuilder: (context, state) =>
          const MaterialPage(fullscreenDialog: true, child: LocationScreen()),
    ),

    // Salutation
    GoRoute(
      path: '/salutation',
      builder: (context, state) => const Salutation(),
    ),

    // Home
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) =>
          FadeTransitionPage(key: state.pageKey, child: const Home()),
      routes: [
        GoRoute(
          path: 'search',
          builder: (context, state) => const Search(),
        ),

        GoRoute(
          path: 'categories',
          builder: (context, state) => const Categories(),
        ),

        GoRoute(
          path: 'foodPlace',
          builder: (context, state) =>
              Canteen(appBarTitle: state.queryParams['appBarTitle']!),
          routes: [
            GoRoute(
              path: 'menu',
              builder: (context, state) => const Menu(),
              routes: [
                GoRoute(
                  path: 'rate',
                  pageBuilder: (context, state) =>
                      const MaterialPage(fullscreenDialog: true, child: Rate()),
                ),
              ],
            ),
          ],
        ),

        // Settings
        GoRoute(
          path: 'profile',
          builder: (context, state) => const Profile(),
          routes: [
            GoRoute(
              path: 'myProfile',
              builder: (context, state) => const EditProfile(),
            ),
            GoRoute(
              path: 'favourite',
              builder: (context, state) => const Favourite(),
            ),
            GoRoute(
              path: 'suggestPlace',
              builder: (context, state) => const SuggestPlace(),
            ),
            GoRoute(
              path: 'help',
              builder: (context, state) => const HelpAbout(),
            ),
            GoRoute(
              path: 'feedback',
              builder: (context, state) => const Feedback(),
            ),
            GoRoute(
              path: 'settings',
              builder: (context, state) => const Settings(),
            ),
            GoRoute(
              path: 'aboutUs',
              builder: (context, state) => const About(),
            ),
          ],
        ),
      ],
    ),
  ],
);
