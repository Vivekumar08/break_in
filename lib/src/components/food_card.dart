import 'package:flutter/material.dart';
import '../utils/images.dart';
import '../style/palette.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(width: 2.0, color: Palette.stroke),
      ),
      child: Column(
        children: [
          Expanded(flex: 2, child: Images.tempFood),
          Expanded(child: Column(children: [])),
        ],
      ),
    );
    // child: Stack(children: [
    // Positioned(top: 0, child: Images.tempFood),
    // ],)
  }
}
