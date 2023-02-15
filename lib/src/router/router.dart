import 'package:break_in/src/components/food_card.dart';
import 'package:break_in/src/pages/canteen.dart';
import 'package:break_in/src/pages/menu.dart';
import 'package:go_router/go_router.dart';
import 'constants.dart';
import '../login/login_with_phone.dart';
import '../login/new_password.dart';
import '../login/login_with_mail.dart';
import '../login/forgot_passwd.dart';
import '../login/password_changed.dart';
import '../login/register_with_mail.dart';
import '../login/register_with_phone.dart';
import '../login/otp_with_mail.dart';
import '../login/otp_with_phone.dart';
import '../login/register_with_otp.dart';
import '../onboarding/onboarding.dart';
import '../onboarding/salutation.dart';
import '../location/detected_location.dart';
import '../home/home.dart';
import '../home/categories.dart';
import '../profile/detect_new_location.dart';
import '../profile/feedback.dart';
import '../profile/help_about.dart';
import '../profile/my_profile.dart';
import '../profile/our_mission.dart';
import '../profile/our_story.dart';
import '../profile/our_team.dart';
import '../profile/our_value.dart';
import '../profile/profile.dart';
import '../profile/suggest_place.dart';
import '../profile/about_us.dart';
import '../profile/settings.dart';
import '../style/transitions.dart';

final router = GoRouter(
  initialLocation: profile,
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
      pageBuilder: (context, state) =>
          FadeTransitionPage(key: state.pageKey, child: const Home()),
      routes: [
        GoRoute(
          path: 'categories',
          pageBuilder: (context, state) =>
              FadeTransitionPage(key: state.pageKey, child: const Categories()),
          routes: [
            GoRoute(
              path: 'canteen',
              builder: (context, state) => const Canteen(),
              routes: [
                GoRoute(
                  path: 'menu',
                  builder: (context, state) => const Menu(),
                )
              ],
            )
          ],
        ),
        // GoRoute(
        //   path: 'Ratings',
        //   pageBuilder: (context, state) => FadeTransitionPage(
        //       key: state.pageKey, child: const Categories()),
        // ),
      ],
    ),

    // Profile
    GoRoute(
      path: '/profile',
      builder: (context, state) => const Profile(),
      routes: [
        GoRoute(
          path: 'myProfile',
          builder: (context, state) => const MyProfile(),
          routes: [
            GoRoute(
              path: 'detectionNewLocation',
              builder: (context, state) => const DetectingNewLocation(),
            )
          ],
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
          builder: (context, state) => const AboutUs(),
          routes: [
            GoRoute(
              path: "ourStory",
              builder: (context, state) => const OurStory(),
            ),
            GoRoute(
              path: "ourValue",
              builder: (context, state) => const OurValue(),
            ),
            GoRoute(
              path: "ourMission",
              builder: (context, state) => const OurMission(),
            ),
            GoRoute(
              path: "ourTeam",
              builder: (context, state) => const OurTeam(),
            ),
          ],
        ),
      ],
    ),
  ],
);
