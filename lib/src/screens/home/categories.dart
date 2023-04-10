import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../router/constants.dart';
import '../../style/fonts.dart';
import '../../utils/symbols.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  Widget _buildCategories(String text, Image image, BuildContext context) =>
      ListTile(
        leading: image,
        title: Text(text, style: Fonts.poppins),
        horizontalTitleGap: 0,
        onTap: () => context.go('$foodPlace/$text'),
        dense: true,
        trailing: const Icon(Icons.chevron_right, size: 32),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text("Categories", style: Fonts.appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _buildCategories("Canteen", Symbols.canteen, context),
            _buildCategories("Mess", Symbols.mess, context),
            _buildCategories("Micro Cafe", Symbols.microCafe, context),
            _buildCategories("Juice Corner", Symbols.juiceCorner, context),
            _buildCategories("Tea Stall", Symbols.teaStall, context),
            _buildCategories("Fruit Cart", Symbols.fruit, context),
            _buildCategories("Diary Booth", Symbols.diary, context),
            _buildCategories("Ice Cream Trolly", Symbols.ice, context),
            _buildCategories("Other Food Spot", Symbols.others, context),
          ],
        ),
      ),
    );
  }
}
