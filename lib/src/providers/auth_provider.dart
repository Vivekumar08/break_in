
import 'package:flutter/foundation.dart';
import '../locator.dart';
import '../models/models.dart';
import '../services/api/api.dart';

// ignore: constant_identifier_names
enum AuthState { Uninitialized, Authenticated, Authenticating, Unauthenticated }

extension CheckAuthenticated on AuthState {
  bool isAuthenticated() => this == AuthState.Authenticated ? true : false;
}

class AuthProvider extends ChangeNotifier {
  late User _user;
  AuthState _state = AuthState.Unauthenticated;

  AuthState get state => _state;

  AuthProvider.initialize();

  void _changeAuthState(AuthState authState) {
    _state = authState;
    notifyListeners();
  }

  void loginWithMail({
    required String email,
    required String password,
  }) async {
    _changeAuthState(AuthState.Authenticating);
    User? user =
        await locator.get<AuthService>().loginWithMail(email, password);
    if (user != null) {
      _user = user;
      _changeAuthState(AuthState.Authenticated);
    } else {
      _changeAuthState(AuthState.Unauthenticated);
    }
  }

  void registerWithMail({
    required String name,
    required String email,
    required String password,
  }) async {
    _changeAuthState(AuthState.Authenticating);
    User? user = await locator
        .get<AuthService>()
        .registerWithMail(name, email, password);
    if (user != null) {
      _user = user;
      _changeAuthState(AuthState.Authenticated);
    } else {
      _changeAuthState(AuthState.Unauthenticated);
    }
  }
}
