import 'package:break_in/src/components/food_card.dart';
import 'package:break_in/src/style/fonts.dart';
import 'package:flutter/material.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text("My Favourite", style: Fonts.appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: ListView.separated(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) =>
              const FoodCard(isFavourite: true),
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 16.0),
        ),
      ),
    );
  }
}
