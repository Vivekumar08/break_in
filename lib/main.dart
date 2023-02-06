import 'package:flutter/material.dart' hide Router;
import 'src/navigation/constants.dart';
import 'src/navigation/router.dart';
import 'src/style/palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Palette.background_2),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.generateRoute,
      initialRoute: login,
    );
  }
}
