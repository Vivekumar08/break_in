import 'package:break_in/src/components/food_card.dart';
import 'package:break_in/src/style/fonts.dart';
import 'package:flutter/material.dart';

class Canteen extends StatelessWidget {
  const Canteen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leadingWidth: 72.0,
          title: Text("Canteen", style: Fonts.appBarTitle),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            child: ListView(
              children: [
                FoodCard(
                  isFavourite: true,
                  isVisited: true,
                  date: '04/02/2023',
                ),
              ],
            )));
  }
}
