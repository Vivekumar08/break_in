import 'package:flutter/foundation.dart';
import 'constants.dart';
import '../locator.dart';
import '../models/models.dart';
import '../services/api/api.dart';
import '../services/db/db.dart';
import '../style/snack_bar.dart';

// AuthProvider Constants
// ignore: constant_identifier_names
enum AuthState { Uninitialized, Authenticated, Authenticating, Unauthenticated }

extension AuthExtension on AuthState {
  bool isAuthenticated() => this == AuthState.Authenticated ? true : false;
}

class AuthProvider extends ChangeNotifier {
  AuthState _state = AuthState.Uninitialized;

  AuthState get state => _state;

  AuthProvider.init();

  AuthProvider.fromToken(bool token) {
    if (token) {
      _changeAuthState(AuthState.Authenticated);
    }
  }

  void _changeAuthState(AuthState authState) {
    _state = authState;
    notifyListeners();
  }

  Future<void> loginWithMail({
    required String email,
    required String password,
  }) async {
    _changeAuthState(AuthState.Authenticating);
    Map<String, dynamic> response =
        await locator.get<AuthService>().loginWithMail(email, password);

    print(response);

    if (response[code] == 200) {
      User user = User.fromJson(response[userLogin]);
      locator.get<TokenStorage>().setToken(response[token]);
      await locator.isReady<UserStorage>();
      locator.get<UserStorage>().addUser(user);
      _changeAuthState(AuthState.Authenticated);
    } else {
      if (response[msg] != null) {
        showSnackBar(response[msg].toString());
      }
      _changeAuthState(AuthState.Unauthenticated);
    }
  }

  Future<void> registerWithMail({
    required String name,
    required String email,
    required String password,
  }) async {
    _changeAuthState(AuthState.Authenticating);
    Map<String, dynamic> response = await locator
        .get<AuthService>()
        .registerWithMail(name, email, password);

    print(response);

    if (response[code] == 200) {
      User user = User.fromJson(response[savedUser]);
      locator.get<TokenStorage>().setToken(response[token]);
      await locator.isReady<UserStorage>();
      locator.get<UserStorage>().addUser(user);
      _changeAuthState(AuthState.Authenticated);
    } else {
      if (response[msg] != null) {
        showSnackBar(response[msg].toString());
      }
      _changeAuthState(AuthState.Unauthenticated);
    }
  }
}
