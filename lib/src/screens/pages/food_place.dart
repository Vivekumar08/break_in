import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../components/food_card.dart';
import '../../components/input_field.dart';
import '../../models/example.dart';
import '../../models/models.dart';
import '../../providers/providers.dart';
import '../../router/constants.dart';
import '../../style/fonts.dart';
import '../../style/palette.dart';

class FoodPlace extends StatefulWidget {
  const FoodPlace({super.key, required this.appBarTitle});

  final String appBarTitle;

  @override
  State<FoodPlace> createState() => _FoodPlaceState();
}

class _FoodPlaceState extends State<FoodPlace> {
  TextEditingController q = TextEditingController();

  @override
  void dispose() {
    q.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<AppProvider>().searchViaCategory(
          context.read<LocationProvider>().location!, widget.appBarTitle),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text(widget.appBarTitle, style: Fonts.appBarTitle),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: SearchField(
            hintText: "Search for ${widget.appBarTitle.toLowerCase()}",
            controller: q,
            onChanged: (value) => setState(() {}),
          ),
        ),
      ),
      body: Consumer<AppProvider>(builder: (context, ap, _) {
        return !ap.state.isLoading() && ap.foodPlace.isEmpty
            ? Center(
                child: RichText(
                  text: TextSpan(
                    text: 'No ${widget.appBarTitle} yet. ',
                    style: Fonts.appBarTitle,
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.push(suggestPlace),
                        text: 'Suggest One',
                        style: Fonts.appBarTitle.copyWith(color: Palette.link),
                      ),
                    ],
                  ),
                ),
              )
            : ListView.separated(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22.0),
                itemCount: ap.state.isLoading() ? 4 : ap.foodPlace.length,
                itemBuilder: (context, index) => ap.state.isLoading()
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: FoodCard(
                            model: FoodPlaceModel.fromJson(menuExample)))
                    : ap.foodPlace[index].name.toLowerCase().contains(q.text)
                        ? FoodCard(model: ap.foodPlace[index])
                        : Container(),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 16.0),
              );
      }),
    );
  }
}
