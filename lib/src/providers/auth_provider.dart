import 'package:flutter/foundation.dart';
import 'constants.dart';
import 'token_provider.dart';
import '../locator.dart';
import '../models/models.dart';
import '../services/api/api.dart';
import '../services/db/db.dart';
import '../style/snack_bar.dart';

class AuthProvider extends ChangeNotifier {
  late User _user;
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
    Map<String, dynamic>? response =
        await locator.get<AuthService>().loginWithMail(email, password);

    if (response[code] == 200) {
      _user = User.fromJson(response[UserLogin]);
      locator
          .get<TokenStorage>()
          .setToken(response[token])
          .whenComplete(() => TokenProvider.init());
      _changeAuthState(AuthState.Authenticated);
    } else {
      showSnackBar(response[msg].toString());
      _changeAuthState(AuthState.Unauthenticated);
    }
  }

  Future<void> registerWithMail({
    required String name,
    required String email,
    required String password,
  }) async {
    _changeAuthState(AuthState.Authenticating);
    Map<String, dynamic>? response = await locator
        .get<AuthService>()
        .registerWithMail(name, email, password);

    if (response[code] == 200) {
      _user = User.fromJson(response[UserLogin]);
      locator
          .get<TokenStorage>()
          .setToken(response[token])
          .whenComplete(() => TokenProvider.init());
      _changeAuthState(AuthState.Authenticated);
    } else {
      showSnackBar(response[msg]);
      _changeAuthState(AuthState.Unauthenticated);
    }
  }
}
