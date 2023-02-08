import 'package:flutter/material.dart';
import '../style/palette.dart';
import '../style/fonts.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.inputText,
    required this.hintText,
    required this.controller,
  });

  final String inputText;
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Text(inputText, style: Fonts.inputText),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Palette.inputField,
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(width: 1, color: Palette.stroke)),
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(width: 1, color: Palette.stroke)),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(width: 1, color: Palette.stroke)),
            contentPadding: const EdgeInsets.all(16.0),
            hintText: hintText,
            hintStyle: Fonts.hintText,
          ),
        ),
      ),
    ]);
  }
}
