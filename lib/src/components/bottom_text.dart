import 'package:flutter/material.dart';
import '../style/fonts.dart';

class BottomText extends StatelessWidget {
  /// Bottom Text is a [Row] for a text & button
  ///
  /// Input [text] for text at [bottom-center]
  ///
  /// Input [buttonText] & [onPressed] for button at [bottom-center]
  const BottomText({Key? key, this.text, this.buttonText, this.onPressed})
      : super(key: key);

  final String? text;
  final String? buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text == null
            ? Container()
            : Text(text!, style: Fonts.textButton.copyWith(fontSize: 14.0)),
        buttonText == null
            ? Container()
            : TextButton(
                onPressed: onPressed,
                child: Text(buttonText!, style: Fonts.inputText)),
      ],
    );
  }
}
