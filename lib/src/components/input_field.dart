import 'package:flutter/material.dart';
import '../style/palette.dart';
import '../style/fonts.dart';

class InputField extends StatelessWidget {
  /// Creates the [TextField] with prerequisite UI
  ///
  /// If [expands] is set to `True` (default `False`), then [height] should be
  /// non-null to prevent overflow
  ///
  const InputField({
    super.key,
    required this.inputText,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.expands = false,
    this.height,
  }) : assert(
          (!expands && height == null) || (expands && height != null),
          'height must be non-null, when expands is true.',
        );

  final String inputText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool expands;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(inputText, style: Fonts.inputText),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: SizedBox(
            height: height,
            child: TextField(
              controller: controller,
              textAlignVertical: TextAlignVertical.top,
              expands: expands,
              maxLines: expands ? null : 1,
              keyboardType: keyboardType,
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
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 14.0),
                hintText: hintText,
                hintStyle: Fonts.hintText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
