import 'package:flutter/material.dart';
import '../components/input_field.dart';
import '../style/fonts.dart';
import '../style/palette.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController location = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text("My Profile", style: Fonts.appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputField(
                inputText: "Name*",
                hintText: "Enter Your Name",
                controller: name),
            InputField(
                inputText: "Phone*",
                hintText: "Enter Your Phone Number",
                controller: phone),
            InputField(
                inputText: "Email*",
                hintText: "Enter Your Email",
                controller: email),
            InputField(
                inputText: "Location*",
                hintText: "Enter Location",
                controller: location),
            const SizedBox(height: 16.0),
            Text(
              "Detect New Location",
              style: Fonts.textButton.copyWith(color: Palette.link),
            ),
          ],
        ),
      ),
    );
  }
}
