import 'package:flutter/material.dart';
import '../style/palette.dart';
import '../style/fonts.dart';

class HrText extends StatelessWidget {
  const HrText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
