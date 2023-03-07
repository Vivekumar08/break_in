import 'package:break_in/src/locator.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:provider/provider.dart';
import 'src/providers/providers.dart';
import 'src/router/router.dart';
import '../src/style/theme.dart';
import 'src/style/snack_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => TokenProvider.init()),
        ChangeNotifierProxyProvider<TokenProvider, AuthProvider>(
          create: (context) => AuthProvider.init(),
          update: (_, token, __) => AuthProvider.fromToken(token.tokenExists),
        ),
      ],
      child: MaterialApp.router(
        theme: theme,
        debugShowCheckedModeBanner: true,
        scaffoldMessengerKey: scaffoldMessengerKey,
        routerConfig: router,
      ),
    );
  }
}
