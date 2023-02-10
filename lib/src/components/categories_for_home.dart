import 'package:break_in/src/style/fonts.dart';
import 'package:break_in/src/style/palette.dart';
import 'package:break_in/src/utils/images.dart';
import 'package:flutter/material.dart';

class CategoriesForHome extends StatelessWidget {
  const CategoriesForHome({super.key, required this.text, required this.image});
  final String text;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.symmetric(
              vertical: 13.08 - 8.0, horizontal: 14.17 - 8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Palette.stroke),
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(image: image, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          text,
          style: Fonts.medTextBlack
              .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
        )
      ],
    );
  }
}
