import 'package:break_in/src/components/food_card.dart';
import 'package:break_in/src/style/fonts.dart';
import 'package:flutter/material.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leadingWidth: 72.0,
          title: Text("My Favorites", style: Fonts.appBarTitle),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: ListView(
              children: const [
                FoodCard(
                  isFavourite: true,
                  isVisited: true,
                  date: '04/02/2023',
                ),
              ],
            )));
  }
}