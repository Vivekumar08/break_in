import 'package:break_in/src/components/button.dart';
import 'package:break_in/src/components/input_field.dart';
import 'package:break_in/src/style/fonts.dart';
import 'package:flutter/material.dart';

class Feedback extends StatelessWidget {
  const Feedback({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController feedback = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Icon(Icons.chevron_left, size: 32.0),
        ),
        title: Text("Feedback", style: Fonts.appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputField(
              inputText: "Feedback*",
              hintText: "I really love this application due to ...",
              controller: feedback,
              expands: true,
              height: 90.0,
            ),
            const SizedBox(height: 16.0),
            const Spacer(),
            Button(onPressed: () {}, buttonText: "Send Feedback"),
          ],
        ),
      ),
    );
  }
}
