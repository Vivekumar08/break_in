import 'package:flutter/material.dart';
import '../style/palette.dart';
import '../utils/symbols.dart';

class AuthOptions extends StatelessWidget {
  const AuthOptions({Key? key, required this.emailAuth}) : super(key: key);

  final bool emailAuth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _AuthButton(icon: Symbols.facebookIcon, onTap: () {})),
        const SizedBox(width: 8),
        Expanded(child: _AuthButton(icon: Symbols.googleIcon, onTap: () {})),
        const SizedBox(width: 8),
        emailAuth
            ? Expanded(child: _AuthButton(icon: Symbols.mailIcon, onTap: () {}))
            : Expanded(
                child: _AuthButton(icon: Symbols.phoneIcon, onTap: () {})),
      ],
    );
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
