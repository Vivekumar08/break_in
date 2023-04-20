import 'package:flutter/foundation.dart';
import '../locator.dart';
import '../models/models.dart';
import '../services/api/api.dart';
import '../services/cache/cache.dart';
import '../services/db/db.dart';
import '../style/snack_bar.dart';
import 'constants.dart';

// ignore: constant_identifier_names
enum AppState { Idle, Busy, Error }

extension AppExtension on AppState {
  bool isLoading() => this == AppState.Busy ? true : false;
  bool isError() => this == AppState.Error ? true : false;
}

class AppProvider extends ChangeNotifier {
  AppState _state = AppState.Idle;
  AppState get state => _state;

  List<FoodPlaceModel> hotspots = [];
  List<FoodPlaceModel> categorySearchResults = [];
  SearchResults searchResults = SearchResults();

  void _changeState(AppState appState) {
    _state = appState;
    notifyListeners();
  }

  Future<void> getHotspots(Location location) async {
    _changeState(AppState.Busy);
    String? token = await locator.get<TokenStorage>().getToken();

    List<dynamic> response = await locator
        .get<AppService>()
        .hotspots(token!, location.lat, location.lng);

    // ignore: avoid_function_literals_in_foreach_calls
    response.forEach((element) {
      hotspots.add(FoodPlaceModel.fromJson(element));
    });

    _changeState(AppState.Idle);
  }

  Future<void> searchViaCategory(Location location, String category) async {
    categorySearchResults = [];
    _changeState(AppState.Busy);
    String? token = await locator.get<TokenStorage>().getToken();

    List<dynamic> response = await locator
        .get<AppService>()
        .filterSearch(token!, location.lat, location.lng, category);

    // ignore: avoid_function_literals_in_foreach_calls
    response.forEach((element) {
      categorySearchResults.add(FoodPlaceModel.fromJson(element));
    });

    _changeState(AppState.Idle);
  }

  Future<void> search(String query) async {
    searchResults;
    _changeState(AppState.Busy);

    String? token = await locator.get<TokenStorage>().getToken();

    Map<String, dynamic> response =
        await locator.get<AppService>().search(token!, query);

    if (response[code] == 200) searchResults = SearchResults.fromJson(response);

    _changeState(AppState.Idle);
  }

  Future<FoodPlaceModel?> getfoodPlace(String id) async {
    _changeState(AppState.Busy);
    String? token = await locator.get<TokenStorage>().getToken();

    Map<String, dynamic> response =
        await locator.get<AppService>().foodPlace(token!, id);

    if (response[code] == 200) {
      _changeState(AppState.Idle);
      return FoodPlaceModel.fromJson(response);
    } else {
      if (response[err] != null) {
        showSnackBar(response[err].toString());
      }
      _changeState(AppState.Error);
    }
    return null;
  }

  //
  // Service Connectors for Shared Prefrences
  //
  Future<void> setPreference(bool value) async =>
      (await locator.getAsync<Preferences>()).setPreference(value);

  Future<bool?> getPreference() async =>
      (await locator.getAsync<Preferences>()).getPreference();

  Future<void> addHistory(String id, String name) async {
    Map<String, String>? history = await getHistory();
    if (history != null) {
      if (history.length >= 3) history.remove(history.keys.first);
      history.addAll({id: name});
      (await locator.getAsync<History>()).set(history);
    } else {
      (await locator.getAsync<History>()).set({id: name});
    }
  }

  Future<Map<String, String>?> getHistory() async =>
      (await locator.getAsync<History>()).get();

  Future<void> clearHistory() async =>
      (await locator.getAsync<History>()).clear();
}
