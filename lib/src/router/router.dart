import 'package:break_in/src/home/categories.dart';
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
  initialLocation: categories,
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

      // ShellRoute(
      //   builder: (BuildContext context, GoRouterState state, Widget child) {
      //     return MusicAppShell(
      //       child: child,
      //     );
      //   },
      //   routes: <RouteBase>[
      //     GoRoute(
      //       path: '/library',
      //       pageBuilder: (context, state) {
      //         return FadeTransitionPage(
      //           child: const LibraryScreen(),
      //           key: state.pageKey,
      //         );
      //       },
      //       routes: <RouteBase>[
      //         GoRoute(
      //           path: 'album/:albumId',
      //           builder: (BuildContext context, GoRouterState state) {
      //             return AlbumScreen(
      //               albumId: state.params['albumId'],
      //             );
      //           },
      //           routes: [
      //             GoRoute(
      //               path: 'song/:songId',
      //               // Display on the root Navigator
      //               builder: (BuildContext context, GoRouterState state) {
      //                 return SongScreen(
      //                   songId: state.params['songId']!,
      //                 );
      //               },
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //     GoRoute(
      //       path: '/recents',
      //       pageBuilder: (context, state) {
      //         return FadeTransitionPage(
      //           child: const RecentlyPlayedScreen(),
      //           key: state.pageKey,
      //         );
      //       },
      //       routes: <RouteBase>[
      //         GoRoute(
      //           path: 'song/:songId',
      //           // Display on the root Navigator
      //           builder: (BuildContext context, GoRouterState state) {
      //             return SongScreen(
      //               songId: state.params['songId']!,
      //             );
      //           },
      //         ),
      //       ],
      //     ),
      //     GoRoute(
      //       path: '/search',
      //       pageBuilder: (context, state) {
      //         final query = state.queryParams['q'] ?? '';
      //         return FadeTransitionPage(
      //           child: SearchScreen(
      //             query: query,
      //           ),
      //           key: state.pageKey,
      //         );
      //       },
      //     ),
      //   ],
      // ),

    // Home
    GoRoute(
      path: '/home',
      builder: (context, state) => const Home(),
      routes: [
        GoRoute(path: 'categories',builder: (context, state) => const Categories(),)
      ]
    ),
  ],
);
