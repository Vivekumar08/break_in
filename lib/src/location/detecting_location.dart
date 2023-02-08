import 'package:break_in/src/components/location_detection.dart';
import 'package:break_in/src/style/palette.dart';
import 'package:flutter/material.dart';

class DetectingLocation extends StatelessWidget {
  const DetectingLocation({super.key});

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
                border: Border.all(color: Palette.secondary.withOpacity(0.32)),
                borderRadius: BorderRadius.circular(16.0),
                color: Palette.stroke
              ),
              width: 330,
              height: 185,
              child: const LocationDetection(
                  head: "Detecting Location", location: "")),
        ),
      ),
    );
  }
}
