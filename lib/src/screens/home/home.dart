import 'package:flutter/material.dart' hide MenuBar;
import 'package:go_router/go_router.dart';
import '../../components/input_field.dart';
import '../../router/constants.dart';
import '../../style/fonts.dart';
import '../../style/palette.dart';
import '../../utils/images.dart';
import '../../utils/symbols.dart';
import '../../utils/gifs.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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

  Widget _buildExploreByFeeling(String heading, String buttonText, String text,
          VoidCallback onPressed, Image image) =>
      Container(
        height: 118,
        decoration: BoxDecoration(
          border: Border.all(color: Palette.stroke),
          borderRadius: BorderRadius.circular(8.0),
          color: Palette.inputField,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                child: image,
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(heading, style: Fonts.otpText.copyWith(fontSize: 14)),
                  const SizedBox(height: 4.0),
                  Text(text, style: Fonts.simTextBlack),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    height: 20.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Palette.primary,
                          padding: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4.0)))),
                      onPressed: onPressed,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        child: Text(buttonText,
                            style: Fonts.buttonText.copyWith(fontSize: 10.0)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    final mQ = MediaQuery.of(context).size;
    final categorySize = (mQ.width - 32 - 44) / 3;
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Icon(Icons.location_on_outlined),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text('376 Ground Floor, Mukherjee Nagar,'),
                SizedBox(width: 12.0),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
            const Text('Delhi, India, 110009'),
          ],
        ),
        leadingWidth: 40.0,
        actions: [
          GestureDetector(
              onTap: () => context.go(profile), child: Symbols.profile),
          const SizedBox(width: 24.0),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: SearchField(
                hintText: "Search for canteen", controller: search)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22.0),
        child: ListView(
          children: [
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
                  ],
                ),
                const SizedBox(height: 16.0),
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
            const SizedBox(height: 26.0),
            Container(
              height: 94,
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                color: Palette.primary,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                alignment: Alignment.centerLeft,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "No Compromise\n",
                      style: Fonts.subHeading.copyWith(
                          fontSize: 18.0,
                          color: Palette.white,
                          letterSpacing: 0),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'with food',
                          style: Fonts.medText
                              .copyWith(color: Palette.white, fontSize: 18.0),
                        )
                      ],
                    ),
                  ),
                  Positioned(right: 0, bottom: -14, child: Images.feeding),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Text("Explore by Feeling",
                style: Fonts.heading.copyWith(fontSize: 18)),
            const SizedBox(height: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildExploreByFeeling(
                    "Have a meeting in next 10 minutes?",
                    "Find Nearest Canteen",
                    "Explore food in your institute premises",
                    () {},
                    Gifs.canteen),
                const SizedBox(height: 12),
                _buildExploreByFeeling(
                    "Fedup of eating alone?",
                    "Find Nearest Mess",
                    "Dine out with peers today",
                    () {},
                    Gifs.mess),
                const SizedBox(height: 12),
                _buildExploreByFeeling(
                    "Tired, Need a break?",
                    "Explore Micro Cafe",
                    "Grab a cup of coffee",
                    () {},
                    Gifs.cafe),
                const SizedBox(height: 12),
                _buildExploreByFeeling(
                    "Need to charge yourself?",
                    "Explore Corners",
                    "Eat something fibrous and healthy",
                    () {},
                    Gifs.corners),
                const SizedBox(height: 12),
              ],
            )
          ],
        ),
      ),
    );
  }
}
