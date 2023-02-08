import 'package:break_in/src/components/button.dart';
import 'package:break_in/src/components/input_field.dart';
import 'package:break_in/src/components/location_detection.dart';
import 'package:break_in/src/style/palette.dart';
import 'package:flutter/material.dart';

class ManualLocation extends StatelessWidget {
  const ManualLocation({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController location = TextEditingController();

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
                color: Palette.stroke),
            width: 330,
            height: 374,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LocationDetection(
                    head: "Detecting Location",
                    location:
                        "L4, Jagdish Nagar, Varachha Surat,\nGujarat, India, 395006"),
                const SizedBox(height: 8.0),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22),
                    child: Column(
                      children: [
                        InputField(
                            inputText: "Location*",
                            hintText: "Enter your location",
                            controller: location),
                        const SizedBox(height: 16.0),
                        Button(onPressed: () {}, buttonText: "Save Lovation"),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
