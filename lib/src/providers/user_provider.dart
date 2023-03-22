import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart' show XFile;
import '../locator.dart';
import '../models/models.dart';
import '../services/api/api.dart';
import '../services/db/db.dart';
import '../style/snack_bar.dart';
import 'constants.dart';

// ignore: constant_identifier_names
enum UserState { Uninitialized, Initializing, Initialized, Updating, Updated }

extension UserExtension on UserState {
  bool initialized() => this == UserState.Initialized ? true : false;
  bool updating() => this == UserState.Updating ? true : false;
}

class UserProvider extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  UserState _state = UserState.Uninitialized;
  UserState get state => _state;

  String? get name => _user?.fullName;

  void _changeUserState(UserState userState) {
    _state = userState;
    notifyListeners();
  }

  UserProvider.init() {
    if (user == null) {
      getUserData();
    }
  }

  UserProvider.fromProvider(bool token, bool auth) {
    if (token && auth) {
      if (user == null) {
        getUserData();
      }
    } else {
      _changeUserState(UserState.Uninitialized);
    }
  }

  Future<String> getName() async {
    if (user == null) {
      return getUserData().then((_) => user!.fullName);
    } else {
      return user!.fullName;
    }
  }

  Future<void> getUserData() async {
    locator.isReady<UserStorage>().whenComplete(() {
      dynamic userStored = locator.get<UserStorage>().getUser();
      if (userStored is User) {
        _user = userStored;
        _changeUserState(UserState.Initialized);
      } else {
        getUserDataFromServer();
      }
    });
  }

  Future<void> getUserDataFromServer() async {
    if (state == UserState.Initializing) {
      return;
    }
    _changeUserState(UserState.Initializing);
    String? token = await locator.get<TokenStorage>().getToken();
    Map<String, dynamic> response =
        await locator.get<UserService>().getUserDetails(token!);

    if (response[code] == 200) {
      User user = User.fromJson(response);
      _user = user;
      locator.get<UserStorage>().addUser(user);
      _changeUserState(UserState.Initialized);
    } else {
      _changeUserState(UserState.Uninitialized);
    }
  }

  Future<void> uploadProfilePic(XFile file) async {
    showSnackBar('Uploading...');
    _changeUserState(UserState.Updating);
    String? token = await locator.get<TokenStorage>().getToken();
    Map<String, dynamic> response =
        await locator.get<UserService>().uploadProfilePic(token!, file);

    if (response[code] == 200) {
      showSnackBar(response[msg].toString());
      if (response[fileName] != null) {
        (await locator.getAsync<UserStorage>())
            .updateProfilePic(response[fileName]);
        getUserData();
        _changeUserState(UserState.Updated);
        return;
      }
    } else {
      if (response[error] != null) {
        showSnackBar(response[error].toString());
      }
    }
    _changeUserState(UserState.Initialized);
  }
}
