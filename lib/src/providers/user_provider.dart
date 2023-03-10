import 'package:flutter/foundation.dart';
import '../locator.dart';
import '../models/models.dart';
import '../services/api/api.dart';
import '../services/db/db.dart';
import 'constants.dart';

// ignore: constant_identifier_names
enum UserState { Uninitialized, Initialized }

extension UserExtension on UserState {
  bool initialized() => this == UserState.Initialized ? true : false;
}

class UserProvider extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  UserState _state = UserState.Uninitialized;
  UserState get state => _state;

  // Details
  String? get name => user?.FullName;

  UserProvider.init() {
    if (user == null) {
      locator.isReady<UserStorage>().whenComplete(() {
        dynamic userStored = locator.get<UserStorage>().getUser();
        if (userStored is User) {
          _user = userStored;
          _changeUserState(UserState.Initialized);
        } else {
          getUserData();
        }
      });
    }
  }

  UserProvider.fromProvider(bool token, bool auth) {
    if (token && auth) {
      if (user == null) {
        locator.isReady<UserStorage>().whenComplete(() {
          dynamic userStored = locator.get<UserStorage>().getUser();
          if (userStored is User) {
            _user = userStored;
            _changeUserState(UserState.Initialized);
          } else {
            getUserData();
          }
        });
      }
    } else {
      _changeUserState(UserState.Uninitialized);
    }
  }

  void _changeUserState(UserState userState) {
    _state = userState;
    notifyListeners();
  }

  Future<void> getUserData() async {
    // _changeUserState(UserState.Uninitialized);
    String? token = await locator.get<TokenStorage>().getToken();
    Map<String, dynamic> response =
        await locator.get<UserService>().getUserDetails(token!);

    print(response);

    if (response[code] == 200) {
      User user = User.fromJson(response[userLogin]);
      _user = user;
      locator.get<UserStorage>().addUser(user);
      // _changeUserState(UserState.Initialized);
    }
  }
}
