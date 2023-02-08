import 'package:flutter/material.dart' hide Router;
import 'src/router/constants.dart';
import 'src/router/router.dart';
import 'src/style/palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Palette.white),
      debugShowCheckedModeBanner: true,
      onGenerateRoute: Router.generateRoute,
      initialRoute: manualLocation,
    );
  }
}
