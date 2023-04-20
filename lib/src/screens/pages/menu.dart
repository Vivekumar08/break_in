import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../components/accordion.dart';
import '../../components/button.dart';
import '../../models/example.dart';
import '../../models/models.dart';
import '../../providers/providers.dart';
import '../../router/constants.dart';
import '../../services/constants.dart';
import '../../style/fonts.dart';
import '../../style/message_dialog.dart';
import '../../style/palette.dart';
import '../../utils/functions.dart';
import '../../utils/symbols.dart';

class Menu extends StatefulWidget {
  const Menu({super.key, required this.id});

  final String id;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  FoodPlaceModel? model;
  ValueNotifier<bool> notifier = ValueNotifier(false);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => context
        .read<AppProvider>()
        .getfoodPlace(widget.id)
        .then((value) => model = value));
    context
        .read<AppProvider>()
        .getPreference()
        .then((value) => notifier.value = value ?? false);
    super.initState();
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<LocationProvider, AppProvider>(
        builder: (context, lp, ap, _) => ap.state.isError()
            ? Scaffold(
                body: Center(
                child: Text('Nothing to show', style: Fonts.appBarTitle),
              ))
            : Scaffold(
                extendBodyBehindAppBar: true,
                floatingActionButton: ap.state.isLoading()
                    ? _buildLoading(
                        FloatingActionButton(
                          backgroundColor: Palette.iconsCol,
                          elevation: 0,
                          onPressed: () {},
                          child: const Icon(Icons.add, size: 32.0),
                        ),
                      )
                    : FloatingActionButton(
                        backgroundColor: Palette.iconsCol,
                        child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Symbols.menuBig),
                        onPressed: () => (model?.menu?.length ?? 0) > 0
                            ? showMenuDialog(
                                context: context,
                                children: List.generate(
                                  model?.menu?.length ?? 0,
                                  (index) => '${model!.menu![index].name} '
                                      '(${model!.menu![index].items?.length})',
                                ),
                              )
                            : null,
                      ),
                body: SafeArea(
                  top: Platform.isAndroid, // No top safe area for IOS
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics()
                        .applyTo(const ClampingScrollPhysics()),
                    child: model == null || ap.state.isLoading()
                        ? _buildLoading(_buildPage(
                            FoodPlaceModel.fromJson(menuExample),
                            loading: true))
                        : _buildPage(model!, loc: lp.location),
                  ),
                ),
              ));
  }

  Shimmer _buildLoading(Widget child) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: AbsorbPointer(
        child: child,
      ),
    );
  }

  Column _buildPage(FoodPlaceModel foodPlace, {Location? loc, bool? loading}) {
    return Column(
      children: [
        Stack(
          children: [
            foodPlace.image.isEmpty
                ? Container(height: 300, color: Palette.white)
                : Container(
                    alignment: Alignment.center,
                    height: 300,
                    child: Image.network('$fileInfo/${foodPlace.image}'),
                  ),
            AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: Palette.white, size: 19.0),
              leadingWidth: 72.0,
              title: Text(foodPlace.name,
                  style: Fonts.appBarTitle.copyWith(color: Palette.white)),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  foodPlace.rating == null ? Container() : Symbols.star,
                  const SizedBox(width: 7.0),
                  foodPlace.rating == null
                      ? Container()
                      : Text(foodPlace.rating!.toStringAsFixed(2),
                          style: Fonts.simTextBlack.copyWith(fontSize: 16.0)),
                  const Spacer(),
                  const Icon(Icons.favorite_outline),
                  const SizedBox(width: 20.0),
                  const Icon(Icons.share_outlined),
                  const SizedBox(width: 20.0),
                  IconButton(
                      onPressed: () => context.push(rate), icon: Symbols.rate),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(foodPlace.name,
                  style: Fonts.otpText.copyWith(fontSize: 16.0)),
              const SizedBox(height: 4.0),
              Text(foodPlace.location.address, style: Fonts.simTextBlack),
              const SizedBox(height: 12.0),
              Row(
                children: [
                  const Icon(Icons.watch_later_outlined, size: 16.0),
                  const SizedBox(width: 6.33),
                  loc == null
                      ? Container()
                      : Text(
                          calculateTime(calculateDistance(loc.lat, loc.lng,
                              foodPlace.location.lat, foodPlace.location.lng)),
                          style: Fonts.appBarTitle.copyWith(fontSize: 12.0)),
                  const Spacer(),
                  Text('Get Directions',
                      style: Fonts.textButton.copyWith(color: Palette.link)),
                  Icon(Icons.arrow_forward, size: 12.0, color: Palette.link),
                ],
              ),
              const SizedBox(height: 26.0),
              Row(
                children: [
                  Text('Menu', style: Fonts.otpText.copyWith(fontSize: 16.0)),
                  const Spacer(),
                  Text('Veg Only',
                      style: Fonts.appBarTitle.copyWith(fontSize: 12.0)),
                  const SizedBox(width: 8.0),
                  ToggleButton(
                    notifier: notifier,
                    onTap: (value) =>
                        context.read<AppProvider>().setPreference(value),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              foodPlace.menu == null || foodPlace.menu!.isEmpty
                  ? Text('No Items Yet',
                      style: Fonts.otpText.copyWith(fontSize: 16.0))
                  : _buildMenu(foodPlace.menu!),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenu(List<MenuCategory> menu) {
    return ValueListenableBuilder<bool>(
      valueListenable: notifier,
      builder: (context, value, _) {
        return Column(
          children: List.generate(
            menu.length,
            (index) => MenuAccordion(menu: menu[index]),
          ),
        );
      },
    );
  }
}
