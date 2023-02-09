import 'package:flutter/material.dart';
import '../components/input_field.dart';

TextEditingController controller = TextEditingController();

class OtpField extends StatelessWidget {
  const OtpField({Key? key, required this.length}) : super(key: key);

  final int length;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        length,
        (index) => InputField(
          inputText: '',
          hintText: '',
          controller: controller,
          // expands: true,
          height: 60.0,
        ),
      ),
    );
  }
}
