import 'dart:ffi';

import 'package:break_in/src/components/location_detection.dart';
import 'package:break_in/src/style/fonts.dart';
import 'package:break_in/src/style/palette.dart';
import 'package:flutter/material.dart';

class DetectedLocation extends StatelessWidget {
  const DetectedLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/map.png"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Palette.secondary.withOpacity(0.32)),
                  borderRadius: BorderRadius.circular(16.0),
                  color: Palette.stroke),
              width: 330,
              height: 218,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LocationDetection(
                      head: "Detecting Location", location: "L4, Jagdish Nagar, Varachha Surat,\nGujarat, India, 395006"),
                  // Text(
                  //   "L4, Jagdish Nagar, Varachha Surat,\nGujarat, India, 395006",
                  //   style: Fonts.simText,
                  // ),
                  const SizedBox(height: 16.0),
                  Text(
                    "Edit Location Manually",
                    style: Fonts.simText.copyWith(color: const Color(0xff5d5fEF)),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
