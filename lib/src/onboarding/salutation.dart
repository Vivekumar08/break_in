import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../router/constants.dart';
import '../utils/gifs.dart';
import '../style/fonts.dart';

class Salutation extends StatelessWidget {
  const Salutation({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () => context.go(home));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 2, child: Container()),
          Gifs.hello,
          Text("John", style: Fonts.title, textAlign: TextAlign.center),
          Expanded(flex: 4, child: Container()),
        ],
      ),
    );
  }
}
