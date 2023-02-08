import 'package:flutter/material.dart';
import '../style/fonts.dart';
import '../style/palette.dart';
import '../utils/symbols.dart';

class AuthOptions extends StatelessWidget {
  const AuthOptions({Key? key, required this.emailAuth, required this.text})
      : super(key: key);

  final String text;
  final bool emailAuth;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 32.0, bottom: 22.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: Divider(color: Palette.stroke, thickness: 1.0)),
            const SizedBox(width: 12.0),
            Text(text, style: Fonts.textButton.copyWith(fontSize: 14.0)),
            const SizedBox(width: 12.0),
            Expanded(child: Divider(color: Palette.stroke, thickness: 1.0)),
          ],
        ),
      ),
      Row(
        children: [
          Expanded(
              child: _AuthButton(icon: Symbols.facebookIcon, onTap: () {})),
          const SizedBox(width: 8),
          Expanded(child: _AuthButton(icon: Symbols.googleIcon, onTap: () {})),
          const SizedBox(width: 8),
          emailAuth
              ? Expanded(
                  child: _AuthButton(icon: Symbols.mailIcon, onTap: () {}))
              : Expanded(
                  child: _AuthButton(icon: Symbols.phoneIcon, onTap: () {})),
        ],
      )
    ]);
  }
}

class _AuthButton extends StatelessWidget {
  const _AuthButton({super.key, required this.icon, required this.onTap});

  final Image icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        width: 105,
        decoration: BoxDecoration(
          border: Border.all(color: Palette.stroke),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: icon,
      ),
    );
  }
}
