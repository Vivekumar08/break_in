import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../components/food_card.dart';
import '../../components/input_field.dart';
import '../../models/models.dart';
import '../../providers/providers.dart';
import '../../router/constants.dart';
import '../../style/fonts.dart';
import '../../style/loader.dart';
import '../../style/palette.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController search = TextEditingController();
  Map<String, String>? history;

  @override
  void initState() {
    context
        .read<AppProvider>()
        .getHistory()
        .then((value) => setState(() => history = value));
    search.addListener(_listener);
    super.initState();
  }

  void _listener() {
    if (search.text.length == 2 || search.text.length == 3) setState(() {});
  }

  @override
  void dispose() {
    search.removeListener(_listener);
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text('Search', style: Fonts.appBarTitle),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: SearchField(
            hintText: "Search for canteen, mess...",
            controller: search,
            onChanged: (value) => value.trim().length < 3
                ? null
                : context.read<AppProvider>().search(value),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22.0),
        child: search.text.length < 3
            ? _buildHistory()
            : Consumer<AppProvider>(
                builder: (context, ap, _) => ap.state.isLoading()
                    ? const Loader()
                    : _buildSuggestions(ap.searchResults),
              ),
      ),
    );
  }

  Widget _buildSuggestions(SearchResults sr) {
    int l = sr.foodPlace?.length ?? 0;
    return sr.length == 0
        ? Center(
            child: Text(
            'No Results for ${search.text}',
            style: Fonts.appBarTitle,
          ))
        : ListView(
            children: List.generate(
              sr.length,
              (index) => index < l
                  ? _buildSuggestionUnit(
                      id: sr.foodPlace?.keys.elementAt(index) ?? '',
                      name: sr.foodPlace?.values.elementAt(index) ?? '',
                    )
                  : _buildSuggestionUnit(
                      id: (sr.foodItems?.keys.elementAt(index - l) ?? ''),
                      name: (sr.foodItems?.values.elementAt(index - l) ?? ''),
                      item: true,
                    ),
            ),
          );
  }

  ListTile _buildSuggestionUnit(
      {required String id, required String name, bool item = false}) {
    return ListTile(
      title: Text(name, style: Fonts.appBarTitle),
      subtitle: Text(item ? 'Dish' : 'Food Place', style: Fonts.simTextBlack),
      onTap: () {
        context.read<AppProvider>().addHistory(id, name);
        context.push('$menu?id=$id');
      },
    );
  }

  ListView _buildHistory() {
    return ListView(
      children: [
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('History', style: Fonts.appBarTitle),
            GestureDetector(
              onTap: () async {
                await context.read<AppProvider>().clearHistory();
                history?.clear();
                setState(() {});
              },
              child: Text('Clear', style: Fonts.inputText),
            ),
          ],
        ),
        Row(
          children: List.generate(
            history?.length ?? 0,
            (index) => history == null
                ? Container()
                : _buildHistoryTags(
                    history!.keys.elementAt(history!.length - index - 1),
                    history!.values.elementAt(history!.length - index - 1),
                  ),
          ),
        ),
        const SizedBox(height: 24.0),
        Text('Revisit from Favourites', style: Fonts.appBarTitle),
        const SizedBox(height: 16.0),
        for (int i = 0; i < 4; i++)
          Column(
            children: const [
              // FoodCard(isFavourite: true),
              SizedBox(height: 16.0),
            ],
          ),
      ],
    );
  }

  Widget _buildHistoryTags(String id, String text) {
    return GestureDetector(
      onTap: () => context.push('$menu?id=$id'),
      child: Container(
        height: 26.0,
        margin: const EdgeInsets.only(right: 8.0, top: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
        decoration: BoxDecoration(
            color: Palette.stroke, borderRadius: BorderRadius.circular(40.0)),
        child: Center(child: Text(text, style: Fonts.simTextBlack)),
      ),
    );
  }
}
