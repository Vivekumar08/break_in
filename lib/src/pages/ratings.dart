import 'package:break_in/src/components/food_card.dart';
import 'package:break_in/src/style/fonts.dart';
import 'package:break_in/src/style/palette.dart';
import 'package:flutter/material.dart';
import '../utils/images.dart';
import '../components/button.dart';

class Ratings extends StatelessWidget {
  const Ratings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Palette.white, size: 19.0),
        leadingWidth: 72.0,
        title: Text(
          "The Burger Club",
          style: Fonts.appBarTitle.copyWith(color: Palette.white),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Images.menu,
          const SizedBox(height: 18.0),
          Text('The Burger Club',
                      style: Fonts.otpText.copyWith(fontSize: 16.0)),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0),

          ),
          const Spacer(),
          Button(onPressed: () {}, buttonText: "Submit Ratings"),
        ],
      )),
    );
  }
}
