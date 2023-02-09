import 'package:flutter/material.dart';
import '../style/fonts.dart';
import '../style/palette.dart';

class BottomText extends StatelessWidget {
  /// Bottom Text is a [Row] for a text & button
  ///
  /// Input [text] for text at [bottom-center]
  ///
  /// Input [buttonText] & [onTap] for button at [bottom-center]
  const BottomText({Key? key, this.text, this.buttonText, this.onTap})
      : super(key: key);

  final String? text;
  final String? buttonText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text == null
            ? Container()
            : Text(text!,
                style: Fonts.hintText
                    .copyWith(fontSize: 14.0, color: Palette.iconsCol)),
        const SizedBox(width: 5.0),
        buttonText == null
            ? Container()
            : GestureDetector(
                onTap: onTap,
                child: Text(buttonText!,
                    style: Fonts.buttonText.copyWith(color: Palette.primary))),
      ],
    );
  }
}
