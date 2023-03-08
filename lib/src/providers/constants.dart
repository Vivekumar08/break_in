// ignore_for_file: constant_identifier_names, non_constant_identifier_names

// AuthProvider Constants
enum AuthState { Uninitialized, Authenticated, Authenticating, Unauthenticated }

extension AuthExtension on AuthState {
  bool isAuthenticated() => this == AuthState.Authenticated ? true : false;
}

// AuthSchema
String code = 'code';
String userLogin = 'UserLogin';
String savedUser = 'savedUser';
String token = 'token';
String msg = 'msg';

// OtpProvider Constants
enum OtpState { Null, Sending, Sent, Failed, Unverified, Verifying, Verified }

extension OtpExtension on OtpState {
  bool sent() => this == OtpState.Sent ? true : false;
  bool verified() => this == OtpState.Verified ? true : false;
}
