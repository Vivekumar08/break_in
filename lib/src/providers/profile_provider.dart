import 'package:flutter/foundation.dart';
import '../services/db/db.dart';
import 'constants.dart';
import '../locator.dart';
import '../services/api/api.dart';
import '../style/snack_bar.dart';

// ProfileProvider Constants
// ignore: constant_identifier_names
enum ProfileState { Idle, Busy }

extension ProfileExtension on ProfileState {
  bool isBusy() => this == ProfileState.Busy ? true : false;
}

class ProfileProvider extends ChangeNotifier {
  ProfileState _state = ProfileState.Idle;

  ProfileState get state => _state;

  void _changeAuthState(ProfileState profileState) {
    _state = profileState;
    notifyListeners();
  }

  Future<void> feedback({required String feedback}) async {
    _changeAuthState(ProfileState.Busy);
    String? token = await locator.get<TokenStorage>().getToken();
    Map<String, dynamic> response =
        await locator.get<ProfileService>().feedback(token!, feedback);
    if (response[code] == 200) {
      showSnackBar(response[msg].toString());
    } else {
      if (response[error] != null) {
        showSnackBar(response[error].toString());
      }
    }
    _changeAuthState(ProfileState.Idle);
  }
}
