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
    Future.delayed(const Duration(seconds: 4), () {
      context.go(home);
      final provider = Provider.of<UserProvider>(context, listen: false);
      provider.user?.location == null
          ? context.push(location)
          : context.read<AppProvider>().getHotspots(provider.user!.location!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      body: FutureBuilder<String>(
          initialData: 'User',
          future: user.getName(),
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(flex: 2, child: Container()),
                Gifs.hello,
                Text(snapshot.data.toString(),
                    style: Fonts.title, textAlign: TextAlign.center),
                Expanded(flex: 4, child: Container()),
              ],
            );
          }),
    );
  }
}
