import 'package:flutter/foundation.dart';
import '../locator.dart';
import '../models/models.dart';
import '../services/api/api.dart';
import '../services/db/db.dart';

// ignore: constant_identifier_names
enum AppState { Idle, Busy }

extension AppExtension on AppState {
  bool isLoading() => this == AppState.Busy ? true : false;
}

class AppProvider extends ChangeNotifier {
  AppState _state = AppState.Idle;
  AppState get state => _state;

  List<FoodPlaceModel> hotspots = [];

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
}
