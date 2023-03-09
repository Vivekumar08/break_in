import '../locator.dart';
import '../services/db/db.dart';

class TokenProvider {
  late bool _tokenExists;
  bool get tokenExists => _tokenExists;

  void _changeTokenState(bool tokenState) {
    _tokenExists = tokenState;
  }

  Future<bool> doesTokenExists() async {
    await locator.get<TokenStorage>().getToken().then((token) {
      _changeTokenState(token != null);
    });
    return tokenExists;
  }

  TokenProvider.init() {
    locator.get<TokenStorage>().getToken().then((token) {
      _changeTokenState(token != null);
    });
    // Uncomment the line below to clear token
    // locator.get<TokenStorage>().clearToken();
  }
}
