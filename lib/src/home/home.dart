import 'package:break_in/src/style/palette.dart';
import 'package:break_in/src/utils/symbols.dart';
import 'package:flutter/material.dart';
import '../components/categories_for_home.dart';
import '../style/fonts.dart';
import '../utils/images.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    final double width = (mQ.width - 32 - 44) / 3;
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
          Symbols.profile,
          const SizedBox(width: 24.0),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Categories",
                style: Fonts.heading.copyWith(fontSize: 18),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      CategoriesForHome(
                          text: "Canteen", image: Images.canteen.image),
                      const SizedBox(width: 16),
                      CategoriesForHome(
                          text: "Mess", image: Images.hostelMess.image),
                      const SizedBox(width: 16),
                      CategoriesForHome(
                          text: "Micro Cafe", image: Images.microCafe.image),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      CategoriesForHome(
                          text: "Corners", image: Images.corners.image),
                      const SizedBox(width: 16),
                      CategoriesForHome(
                          text: "Others", image: Images.others.image),
                      const SizedBox(width: 16),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
