import 'package:break_in/src/style/fonts.dart';
import 'package:break_in/src/utils/symbols.dart';
import 'package:flutter/material.dart';

class LocationDetection extends StatelessWidget {
  final String head;
  final String location;
  const LocationDetection({super.key,required this.head,required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Symbols.locationMark,
        Padding(
          padding: const EdgeInsets.only(top: 11),
          child: Text(head, style: Fonts.subHeading),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            location,
            style: Fonts.simText,
            textAlign: TextAlign.center,
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 22.0),
        //   child: Button(buttonText: "Back to Login", onPressed: () {}),
        // )
      ],
    );
  }
}
