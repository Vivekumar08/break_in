import 'package:break_in/src/style/fonts.dart';
import 'package:break_in/src/style/palette.dart';
import 'package:flutter/material.dart';

// class Button extends StatelessWidget {
//   String title;

//   Button({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric( vertical: 11),
//       child: ElevatedButton(

//         style: ElevatedButton.styleFrom(
//             backgroundColor: const Color(0xff523029),
//             ),
//         onPressed: () {},
//         child: Text(
//           title,
//           style: Fonts.buttonText,
//         ),
//       ),
//     );
//   }
// }
class Button extends StatelessWidget {
  /// Creates a rounded button
  ///
  const Button({Key? key, required this.onPressed, required this.buttonText})
      : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 30),
      width: double.maxFinite,
      height: 16,
      child: MaterialButton(
        color: Palette.primary,
        onPressed: onPressed,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Text(buttonText, style: Fonts.buttonText),
      ),
    );
  }
}
