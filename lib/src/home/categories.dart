import 'package:break_in/src/components/search_field.dart';
import 'package:break_in/src/style/fonts.dart';
import 'package:break_in/src/utils/symbols.dart';

import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  Widget _buildCategories(String text, Image image, VoidCallback onPressed) =>
      ListTile(
        leading: image,
        title: Text(text, style: Fonts.poppins),
        horizontalTitleGap: 0,
        dense: true,
        trailing: const Icon(
          Icons.chevron_right,
          size: 32,
        ),
      );
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Icon(Icons.chevron_left, size: 32.0),
        ),
        title: Text("Categories", style: Fonts.appBarTitle),
        // leadingWidth: 40.0,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: SearchField(
                hintText: "Search for category", controller: search)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _buildCategories("Canteen", Symbols.canteen, () {}),
            const SizedBox(
              height: 8,
            ),
            _buildCategories("Mess", Symbols.mess, () {}),
            const SizedBox(
              height: 8,
            ),
            _buildCategories("Micro Cafe", Symbols.microCafe, () {}),
            const SizedBox(
              height: 8,
            ),
            _buildCategories("Juice Corner", Symbols.juiceCorner, () {}),
            const SizedBox(
              height: 8,
            ),
            _buildCategories("Tea Stall", Symbols.teaStall, () {}),
            const SizedBox(
              height: 8,
            ),
            _buildCategories("Fruit Cart", Symbols.fruit, () {}),
            const SizedBox(
              height: 8,
            ),
            _buildCategories("Diary Booth", Symbols.diary, () {}),
            const SizedBox(
              height: 8,
            ),
            _buildCategories("Ice Cream Trolly", Symbols.ice, () {}),
            const SizedBox(
              height: 8,
            ),
            _buildCategories("Other Food Spot", Symbols.others, () {}),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
