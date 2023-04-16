import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../router/constants.dart';
import '../../style/fonts.dart';
import '../../utils/symbols.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Widget _buildCategories(String text, Image image) => ListTile(
        leading: image,
        title: Text(text, style: Fonts.poppins),
        horizontalTitleGap: 0,
        onTap: () => context.go('$foodPlace?appBarTitle=$text'),
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
            _buildCategories("Canteen", Symbols.canteen),
            _buildCategories("Mess", Symbols.mess),
            _buildCategories("Micro Cafe", Symbols.microCafe),
            _buildCategories("Juice Corner", Symbols.juiceCorner),
            // _buildCategories("Tea Stall", Symbols.teaStall),
            // _buildCategories("Fruit Cart", Symbols.fruit),
            _buildCategories("Diary Booth", Symbols.diary),
            // _buildCategories("Ice Cream Trolly", Symbols.ice),
            // _buildCategories("Other Food Spot", Symbols.others),
          ],
        ),
      ),
    );
  }
}
