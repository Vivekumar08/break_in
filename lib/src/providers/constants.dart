// ignore_for_file: constant_identifier_names, non_constant_identifier_names
enum AuthState { Uninitialized, Authenticated, Authenticating, Unauthenticated }

extension CheckAuthenticated on AuthState {
  bool isAuthenticating() => this == AuthState.Authenticating ? true : false;
  bool isAuthenticated() => this == AuthState.Authenticated ? true : false;
}

// AuthSchema
String code = 'code';
String UserLogin = 'UserLogin';
String token = 'token';
String msg = 'msg';
