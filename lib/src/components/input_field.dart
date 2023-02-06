import 'package:break_in/src/style/fonts.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, required this.inputText, required this.hintText, required this.controller});
  final String inputText;
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Text(
          inputText,
          style: Fonts.inputText,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(8))),
            hintText: '    $hintText',
          ),
        ),
      ),
    ]);
  }
}
