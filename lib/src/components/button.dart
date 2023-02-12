import 'package:flutter/material.dart';
import '../style/fonts.dart';
import '../style/palette.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key, required this.onPressed, required this.buttonText, this.color})
      : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 56.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Palette.primary,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)))),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 19.0),
          child: Text(buttonText, style: Fonts.buttonText),
        ),
      ),
    );
  }
}
