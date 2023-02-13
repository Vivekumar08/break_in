import 'package:flutter/material.dart';

import '../style/fonts.dart';
import '../style/palette.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text, style: Fonts.buttonText.copyWith(color: Palette.text)),
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.zero,
      dense: true,
      trailing:
          const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black),
      shape: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black.withOpacity(0.24)),
      ),
      onTap: onPressed,
    );
  }
}
