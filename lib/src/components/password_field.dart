import 'package:flutter/material.dart';
import '../style/fonts.dart';
import '../style/palette.dart';
import '../utils/symbols.dart';

bool isObscure = true;

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.inputText,
    required this.hintText,
    required this.controller,
  });

  final String inputText;
  final String hintText;
  final TextEditingController controller;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(widget.inputText, style: Fonts.inputText),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: TextField(
            controller: widget.controller,
            obscureText: isObscure,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              filled: true,
              suffixIcon: GestureDetector(
                onTap: () => setState(() {
                  isObscure = !isObscure;
                }),
                child: isObscure
                    ? CustomPaint(
                        foregroundPainter: _LinePainter(),
                        child: Symbols.passwordIcon)
                    : Symbols.passwordIcon,
              ),
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
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
              hintText: widget.hintText,
              hintStyle: Fonts.hintText,
            ),
          ),
        ),
      ],
    );
  }
}

class _LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var greyLine = Paint()
      ..color = Palette.iconsCol
      ..strokeWidth = 1.2;

    canvas.drawLine(
        Offset(
          3 * size.width / 8,
          3 * size.height / 8,
        ),
        Offset(
          5 * size.width / 8,
          5 * size.height / 8,
        ),
        greyLine);

    var whiteLine = Paint()
      ..color = Palette.white
      ..strokeWidth = 1.0;

    canvas.drawLine(
        Offset(
          3 * size.width / 8 + 1,
          3 * size.height / 8,
        ),
        Offset(
          5 * size.width / 8 + 1,
          5 * size.height / 8,
        ),
        whiteLine);
  }

  @override
  bool shouldRepaint(_LinePainter oldDelegate) => false;
}
