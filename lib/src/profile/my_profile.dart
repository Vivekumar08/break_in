import 'package:break_in/src/components/input_field.dart';
import 'package:break_in/src/style/fonts.dart';
import 'package:flutter/material.dart';

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
        leading: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Icon(Icons.chevron_left, size: 32.0),
        ),
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
              style: Fonts.simText.copyWith(color: const Color(0xff5d5fEF)),
            ),
          ],
        ),
      ),
    );
  }
}
