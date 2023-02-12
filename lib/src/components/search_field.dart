import 'package:break_in/src/style/fonts.dart';
import 'package:break_in/src/style/palette.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.hintText,
    required this.controller,
  });
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22.0,16.0,22.0,4.0),
      child: Container(
        height: 48.0,
        decoration: BoxDecoration(
            color: Palette.stroke,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(width: 1, color: Palette.stroke)),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Palette.inputField,
            prefixIcon: Icon(
              Icons.search,
              color: Palette.iconsCol,
            ),
            hintText: hintText,
            hintStyle: Fonts.simText.copyWith(color: Palette.greyNormal),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
