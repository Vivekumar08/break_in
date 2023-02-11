import 'package:break_in/src/utils/gifs.dart';
import 'package:flutter/material.dart';
import '../components/search_field.dart';
import '../style/fonts.dart';
import '../style/palette.dart';
import '../utils/images.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _exploreByFeedinng(String heading, String buttonText, String text,
          VoidCallback onPressed, Image image) =>
      Container(
        width: 331,
        height: 118,
        decoration: BoxDecoration(
          border: Border.all(color: Palette.stroke),
          borderRadius: BorderRadius.circular(12.0),
          color: Palette.inputField,
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 83,
              padding: const EdgeInsets.symmetric(
                  vertical: 13.08 - 8.0, horizontal: 14.17 - 8.0),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  heading,
                  style: Fonts.heading.copyWith(fontSize: 14),
                ),
                Text(
                  text,
                  style: Fonts.medText.copyWith(fontSize: 10),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 121,
                  height: 20.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.primary,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)))),
                    onPressed: onPressed,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                      ),
                      child: Text(buttonText,
                          style: Fonts.buttonText.copyWith(fontSize: 9)),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
  Widget _buildCategories(String text, ImageProvider image, double width) =>
      Column(
        children: [
          Container(
            width: width,
            height: 100,
            padding: const EdgeInsets.symmetric(
                vertical: 13.08 - 8.0, horizontal: 14.17 - 8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Palette.stroke),
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(image: image, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            text,
            style: Fonts.medTextBlack
                .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    final mQ = MediaQuery.of(context);
    final categorySize = (mQ.size.width) / 4;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22.0),
          child: ListView(
            children: [
              SearchField(hintText: "Search for canteen", controller: search),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Categories",
                  style: Fonts.heading.copyWith(fontSize: 18),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      _buildCategories(
                          "Canteen", Images.canteen.image, categorySize),
                      const SizedBox(width: 16),
                      _buildCategories(
                          "Mess", Images.hostelMess.image, categorySize),
                      const SizedBox(width: 16),
                      _buildCategories(
                          "Micro Cafe", Images.microCafe.image, categorySize),
                      const SizedBox(width: 16),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      _buildCategories(
                          "Corners", Images.corners.image, categorySize),
                      const SizedBox(width: 16),
                      _buildCategories(
                          "Others", Images.others.image, categorySize),
                      const SizedBox(width: 16),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 38),
              Container(
                width: 330,
                height: 94,
                decoration: BoxDecoration(
                  color: Palette.primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("No Compromise", style: Fonts.buttonText),
                          Text("with food",
                              style:
                                  Fonts.medText.copyWith(color: Palette.white)),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Images.corners,
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Explore by Feeling",
                  style: Fonts.heading.copyWith(fontSize: 18),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _exploreByFeedinng(
                      "Have a meeting in next 10 minutes?",
                      "Find Nearest Canteen",
                      "Explore food in your institute premises",
                      () {},
                      Gifs.canteen),
                  const SizedBox(height: 12),
                  _exploreByFeedinng(
                      "Fedup of eating alone?",
                      "Find Nearest Mess",
                      "Dine out with peers today",
                      () {},
                      Gifs.canteen),
                  const SizedBox(height: 12),
                  _exploreByFeedinng(
                      "Tired, Need a break?",
                      "Explore Micro Cafe",
                      "Grab a cup of coffee",
                      () {},
                      Gifs.canteen),
                  const SizedBox(height: 12),
                  _exploreByFeedinng(
                      "Need to charge yourself?",
                      "Explore Corners",
                      "Eat something fibrous and healthy",
                      () {},
                      Gifs.canteen),
                  const SizedBox(height: 12),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
