import 'package:flutter/material.dart';
import '../../components/food_card.dart';
import '../../components/input_field.dart';
import '../../style/fonts.dart';
import '../../style/palette.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  Widget _buildHistoryTags(String text) => Container(
        height: 26.0,
        margin: const EdgeInsets.only(right: 8.0, top: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
        decoration: BoxDecoration(
            color: Palette.stroke, borderRadius: BorderRadius.circular(40.0)),
        child: Center(child: Text(text, style: Fonts.simTextBlack)),
      );

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text('Search', style: Fonts.appBarTitle),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: SearchField(
              hintText: "Search for canteen, mess...", controller: search),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22.0),
        child: ListView(
          children: [
            const SizedBox(height: 16.0),
            Text('History', style: Fonts.appBarTitle),
            Row(
              children: [
                _buildHistoryTags('Jublee Hall'),
                _buildHistoryTags('Gwyer Hall'),
                _buildHistoryTags('VKRB Mess'),
              ],
            ),
            const SizedBox(height: 24.0),
            Text('Revisit from Previous', style: Fonts.appBarTitle),
            const SizedBox(height: 16.0),
            for (int i = 0; i < 4; i++)
              Column(
                children: const [
                  // FoodCard(isFavourite: true),
                  SizedBox(height: 16.0),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
