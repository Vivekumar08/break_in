import 'package:flutter/material.dart';
import '../style/palette.dart';
import '../style/fonts.dart';

late List<TextEditingController> controllerList;

class OtpField extends StatefulWidget {
  const OtpField({
    Key? key,
    required this.length,
    this.height = 60.0,
    this.space = 17.0,
    required this.controller,
  }) : super(key: key);

  final int length;
  final double? height;
  final double? space;
  final TextEditingController controller;

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  @override
  void initState() {
    controllerList =
        List.generate(widget.length, (index) => TextEditingController());
    super.initState();
  }

  @override
  void dispose() {
    for (var c in controllerList) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context);
    final width = mQ.size.width - widget.space! * (widget.length - 1) - 44;
    return Row(
      children: List.generate(
        widget.length,
        (index) => Row(
          children: [
            SizedBox(
              height: widget.height,
              width: width / widget.length,
              child: TextField(
                controller: controllerList[index],
                keyboardType: TextInputType.number,
                autofocus: index == 0 ? true : false,
                maxLength: 1,
                style: Fonts.otpText,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  counterText: '',
                  filled: true,
                  fillColor: controllerList[index].text.isEmpty
                      ? Palette.inputField
                      : Palette.white,
                  border: controllerList[index].text.isEmpty
                      ? OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          borderSide:
                              BorderSide(width: 1.2, color: Palette.stroke))
                      : OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          borderSide:
                              BorderSide(width: 1.2, color: Palette.otp)),
                  enabledBorder: controllerList[index].text.isEmpty
                      ? OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          borderSide:
                              BorderSide(width: 1.2, color: Palette.stroke))
                      : OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          borderSide:
                              BorderSide(width: 1.2, color: Palette.otp)),
                  focusedBorder: controllerList[index].text.isEmpty
                      ? OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          borderSide:
                              BorderSide(width: 1.2, color: Palette.stroke))
                      : OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          borderSide:
                              BorderSide(width: 1.2, color: Palette.otp)),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 14.0),
                ),
                onChanged: (value) {
                  if (value.length == 1 && index != widget.length - 1) {
                    FocusScope.of(context).nextFocus();
                  }
                  controllerList[index].text = value;
                  widget.controller.text += value;
                  if (controllerList.last.text.isNotEmpty) {
                    FocusScope.of(context).unfocus();
                  }
                  setState(() {});
                },
              ),
            ),
            index != widget.length - 1
                ? const SizedBox(width: 17.0)
                : Container(),
          ],
        ),
      ),
    );
  }
}
