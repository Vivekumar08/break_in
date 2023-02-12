import '../components/search_field.dart';
import '../style/fonts.dart';
import '../utils/symbols.dart';

import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  Widget _buildCategories(String text, Image image, VoidCallback onPressed) =>
      ListTile(
        leading: image,
        title: Text(text, style: Fonts.poppins),
        horizontalTitleGap: 0,
        dense: true,
        trailing: const Icon(Icons.chevron_right, size: 32),
      );
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text("Categories", style: Fonts.appBarTitle),
        // leadingWidth: 40.0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child:
              SearchField(hintText: "Search for category", controller: search),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _buildCategories("Canteen", Symbols.canteen, () {}),
            _buildCategories("Mess", Symbols.mess, () {}),
            _buildCategories("Micro Cafe", Symbols.microCafe, () {}),
            _buildCategories("Juice Corner", Symbols.juiceCorner, () {}),
            _buildCategories("Tea Stall", Symbols.teaStall, () {}),
            _buildCategories("Fruit Cart", Symbols.fruit, () {}),
            _buildCategories("Diary Booth", Symbols.diary, () {}),
            _buildCategories("Ice Cream Trolly", Symbols.ice, () {}),
            _buildCategories("Other Food Spot", Symbols.others, () {}),
          ],
        ),
      ),
    );
  }
}
