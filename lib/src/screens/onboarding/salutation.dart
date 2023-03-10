import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../providers/providers.dart';
import '../../router/constants.dart';
import '../../utils/gifs.dart';
import '../../style/fonts.dart';

class Salutation extends StatefulWidget {
  const Salutation({super.key});

  @override
  State<Salutation> createState() => _SalutationState();
}

class _SalutationState extends State<Salutation> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () => context.go(home));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvider>(builder: (context, user, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(flex: 2, child: Container()),
            Gifs.hello,
            Text(user.state.initialized() ? user.name! : 'User',
                style: Fonts.title, textAlign: TextAlign.center),
            Expanded(flex: 4, child: Container()),
          ],
        );
      }),
    );
  }
}
