import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../router/constants.dart';
import '../screens/pages/menu.dart';
import '../services/constants.dart';
import '../style/palette.dart';
import '../style/fonts.dart';
import '../utils/functions.dart';
import '../utils/symbols.dart';

class FoodCard extends StatelessWidget {
  /// Creates the [FoodCard] with prerequisite UI
  ///
  FoodCard({super.key, this.isFavourite = false, required this.model});

  bool isFavourite;
  final FoodPlaceModel model;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocationProvider>(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(width: 1.0, color: Palette.stroke),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              model.image.isEmpty
                  ? Container(height: 200, color: Palette.white)
                  : Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: Image.network('$fileInfo/${model.image}'),
                    ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 16.0, 16.0, 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Symbols.star,
                        const SizedBox(width: 7.0),
                        Text(
                          model.rating?.toStringAsFixed(2) ?? '',
                          style: Fonts.simTextBlack.copyWith(fontSize: 16.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      model.name,
                      style: Fonts.otpText.copyWith(fontSize: 16.0),
                    ),
                    const SizedBox(height: 6.0),
                    _buildTime(calculateDistance(
                      provider.location!.lat,
                      provider.location!.lng,
                      model.location.lat,
                      model.location.lng,
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 8.0,
          right: 8.0,
          child: CircleAvatar(
            radius: 16.0,
            backgroundColor: Palette.white,
            child: StatefulBuilder(
              builder: (context, setState) {
                return GestureDetector(
                  onTap: () => setState(() => isFavourite = !isFavourite),
                  child: Icon(
                      isFavourite ? Icons.favorite : Icons.favorite_border,
                      size: 18.5,
                      color: isFavourite ? Palette.red : Palette.text),
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 184.0,
          right: 8.0,
          child: GestureDetector(
            onTap: () => context.push(menu),
            child: CircleAvatar(
              radius: 16.0,
              backgroundColor: Palette.iconsCol,
              child: Symbols.menu,
            ),
          ),
        ),
      ],
    );
  }

  Row _buildTime(String dist) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(model.foodType, style: Fonts.simTextBlack),
        Row(
          children: [
            const Icon(Icons.watch_later_outlined, size: 16.0),
            const SizedBox(width: 6.33),
            Text(calculateTime(dist),
                style: Fonts.simTextBlack.copyWith(fontSize: 14.0)),
            const SizedBox(width: 10.0),
            Text('|', style: Fonts.simTextBlack.copyWith(fontSize: 18.0)),
            const SizedBox(width: 8),
            double.tryParse(dist) == null
                ? Container(
                    width: getTextSize('1000 km'),
                    height: 14,
                    color: Palette.white)
                : double.tryParse(dist)! < 1000
                    ? Text('$dist km',
                        style: Fonts.simTextBlack.copyWith(fontSize: 14.0))
                    : Container(
                        width: getTextSize('1000 km'),
                        height: 14,
                        color: Palette.white),
          ],
        )
      ],
    );
  }
}
