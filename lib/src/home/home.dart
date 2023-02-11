import 'package:flutter/material.dart';
import '../components/categories_for_home.dart';
import '../style/fonts.dart';
import '../utils/images.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                      const SizedBox(width: 16),
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
