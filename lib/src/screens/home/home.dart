import 'package:flutter/material.dart' hide MenuBar;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../components/button.dart';
import '../../components/input_field.dart';
import '../../providers/providers.dart';
import '../../router/constants.dart';
import '../../style/fonts.dart';
import '../../style/palette.dart';
import '../../utils/constants.dart';
import '../../utils/images.dart';
import '../../utils/symbols.dart';
import '../../utils/gifs.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    final categorySize = (mQ.width - 32 - 44) / 3;
    return Consumer2<LocationProvider, AppProvider>(
      builder: (context, lp, ap, child) {
        return Scaffold(
          appBar: AppBar(
            leading: const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Icon(Icons.location_on_outlined),
            ),
            title: GestureDetector(
              onTap: () => context.push(location),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text(
                      lp.location?.address ?? '',
                      maxLines: 2,
                      textScaleFactor:
                          MediaQuery.of(context).textScaleFactor.clamp(1, 1.2),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  const Icon(Icons.keyboard_arrow_down),
                  Flexible(child: Container()),
                ],
              ),
            ),
            leadingWidth: 40.0,
            actions: [
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () => context.go(profile),
                child: Symbols.profile,
              ),
              const SizedBox(width: 24.0),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: SearchField(
                hintText: "Search for canteen",
                readOnly: true,
                onTap: () => context.go(search),
              ),
            ),
          ),
          body: ListView(
            children: [
              ap.hotspots.isEmpty && !ap.state.isLoading()
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 22.0, top: 24.0),
                      child: Text(
                        "Nearest Hotspots",
                        style: Fonts.heading
                            .copyWith(fontSize: 18, letterSpacing: 0),
                      ),
                    ),
              const SizedBox(height: 12.0),
              _buildHotspots(ap),
              _buildCategory(categorySize),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 94,
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                        color: Palette.primary,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Stack(
                        alignment: Alignment.centerLeft,
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
                                  style: Fonts.medText.copyWith(
                                      color: Palette.white, fontSize: 18.0),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              right: 0, bottom: -14, child: Images.feeding),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Text("Explore by Feeling",
                        style: Fonts.heading.copyWith(fontSize: 18)),
                    const SizedBox(height: 12.0),
                    _buildExploreByFeeling()
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildHotspots(AppProvider ap) {
    return SizedBox(
      height: ap.hotspots.isEmpty && !ap.state.isLoading() ? 0 : 120,
      child: ap.state.isLoading()
          ? Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: PageView.builder(
                itemCount: 4,
                controller: PageController(viewportFraction: 0.9),
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(right: 12.0),
                  child: _buildHotspotsUnit(
                    type: 'Canteen',
                    name: 'name',
                    image: Images.maggi,
                    id: '',
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
            )
          : ap.hotspots.isEmpty
              ? null
              : PageView.builder(
                  itemCount: ap.hotspots.length,
                  controller: PageController(viewportFraction: 0.9),
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(right: 12.0),
                    child: _buildHotspotsUnit(
                      type: ap.hotspots[index].category.name,
                      name: ap.hotspots[index].name,
                      image: Images.maggi,
                      id: ap.hotspots[index].id,
                      color:
                          index % 2 == 0 ? Palette.background : Palette.stroke,
                    ),
                  ),
                ),
    );
  }

  Widget _buildHotspotsUnit(
      {required String type,
      required String name,
      required Image image,
      required String id,
      required Color color}) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(type, style: Fonts.textButton.copyWith(fontSize: 10.0)),
                Text(name,
                    style: Fonts.heading
                        .copyWith(fontSize: 14.0, letterSpacing: 0)),
                const SizedBox(height: 16.0),
                Button(
                  onPressed: () => context.push('$menu?id=$id'),
                  buttonText: 'See Menu',
                  height: 20.0,
                  expands: false,
                  fontSize: 10.0,
                  borderRadius: 4.0,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: image,
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(double categorySize) {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Categories",
              style: Fonts.heading.copyWith(fontSize: 18),
            ),
          ),
          Row(
            children: List.generate(
              3,
              (index) => _buildCategoryUnit(
                  text: categoryMapWithImage.keys.elementAt(index),
                  image: categoryMapWithImage.values.elementAt(index),
                  width: categorySize),
            ),
          ),
          const SizedBox(height: 16.0),
          Row(children: [
            _buildCategoryUnit(
                text: categoryMapWithImage.keys.elementAt(3),
                image: categoryMapWithImage.values.elementAt(3),
                width: categorySize),
            _buildCategoryUnit(
                text: 'Others',
                image: Images.others,
                width: categorySize,
                route: categories),
          ]),
          const SizedBox(height: 26.0),
        ],
      ),
    );
  }

  Widget _buildCategoryUnit({
    required String text,
    required Image image,
    required double width,
    String? route,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => context.go(
              route ??
                  Uri(path: foodPlace, queryParameters: {'appBarTitle': text})
                      .toString(),
            ),
            child: Container(
              width: width,
              height: 100,
              padding: const EdgeInsets.symmetric(
                  vertical: 13.08 - 8.0, horizontal: 14.17 - 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Palette.stroke),
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(image: image.image, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            text,
            style: Fonts.medTextBlack
                .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget _buildExploreByFeeling() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExploreByFeelingUnit(
            "Have a meeting in next 10 minutes?",
            "Find Nearest Canteen",
            "Explore food in your institute premises",
            Gifs.canteen),
        const SizedBox(height: 12),
        _buildExploreByFeelingUnit("Fedup of eating alone?",
            "Find Nearest Mess", "Dine out with peers today", Gifs.mess),
        const SizedBox(height: 12),
        _buildExploreByFeelingUnit("Tired, Need a break?", "Explore Micro Cafe",
            "Grab a cup of coffee", Gifs.cafe,
            title: "Micro Cafe"),
        const SizedBox(height: 12),
        _buildExploreByFeelingUnit(
            "Need to charge yourself?",
            "Explore Corners",
            "Eat something fibrous and healthy",
            Gifs.corners,
            title: "Juice Corner"),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildExploreByFeelingUnit(
      String heading, String buttonText, String text, Image image,
      {String? title}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
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
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                Button(
                  onPressed: () => context.go(
                    Uri(path: foodPlace, queryParameters: {
                      'appBarTitle': title ?? buttonText.split(" ").last
                    }).toString(),
                  ),
                  buttonText: buttonText,
                  height: 20.0,
                  borderRadius: 4.0,
                  fontSize: 10.0,
                  expands: false,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
