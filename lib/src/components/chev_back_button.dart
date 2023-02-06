import 'package:flutter/material.dart';
import '/src/style/palette.dart';

class ChevBackButton extends StatelessWidget {
  const ChevBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 14.17),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(18.0),
            ),
          ),
          side: BorderSide(color: Palette.stroke, width: 1.5)),
      onPressed: () {},
      child: Icon(
        Icons.chevron_left,
        color: Palette.primary,
        size: 35,
      ),
    );
  }
}
