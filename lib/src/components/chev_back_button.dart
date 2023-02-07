import 'package:flutter/material.dart';
import '../style/palette.dart';

class ChevBackButton extends StatelessWidget {
  const ChevBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.canPop(context) ? Navigator.pop(context) : null,
      child: Container(
        // 8.0 is default padding for an icon
        padding: const EdgeInsets.symmetric(
            vertical: 13.08 - 8.0, horizontal: 14.17 - 8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Palette.stroke),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Icon(Icons.chevron_left, size: 32.0, color: Palette.primary),
      ),
    );
  }
}
