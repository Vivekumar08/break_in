import 'package:break_in/src/components/button.dart';
import 'package:break_in/src/style/fonts.dart';
import 'package:flutter/material.dart';
import 'package:break_in/src/components/input_field.dart';

class SuggestPlace extends StatelessWidget {
  const SuggestPlace({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController location = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Icon(Icons.chevron_left, size: 32.0),
        ),
        title: Text("Suggest a Place", style: Fonts.appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputField(
                inputText: "Place Name*",
                hintText: "Enter Place Name",
                controller: name),
            InputField(
                inputText: "Address*",
                hintText: "Enter Address",
                controller: location),
            InputField(
                inputText: "Contact Number*",
                hintText: "Enter Contact Number",
                controller: phone),
            const SizedBox(height: 16.0),
            const Spacer(),
            Button(onPressed: () {}, buttonText: "Suggest Place"),
          ],
        ),
      ),
    );
  }
}
