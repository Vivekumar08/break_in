// ignore_for_file: constant_identifier_names
import 'package:flutter/foundation.dart';
import 'constants.dart';
import '../locator.dart';
import '../services/api/api.dart';
import '../style/snack_bar.dart';

// OtpProvider Constants
enum OtpState {
  Null,
  Sending,
  Sent,
  Failed,
  Unverified,
  Verifying,
  Verified,
  Expired
}

extension OtpExtension on OtpState {
  bool sent() => this == OtpState.Sent ? true : false;
  bool verified() => this == OtpState.Verified ? true : false;
  bool expired() => this == OtpState.Expired ? true : false;
}

class OtpProviderViaMail extends ChangeNotifier {
  OtpState _state = OtpState.Null;
  OtpState get state => _state;

  String? _email;
  String get email => _email ?? '';

  void _changeAuthState(OtpState otpState) {
    _state = otpState;
    notifyListeners();
  }

  Future<void> forgotPassword({required String email}) async {
    _changeAuthState(OtpState.Sending);
    Map<String, dynamic> response =
        await locator.get<OtpServiceViaEmail>().forgotPassword(email);

    if (response[code] == 200) {
      _email = email;
      showSnackBar(response[msg].toString());
      _changeAuthState(OtpState.Sent);
    } else {
      if (response[error] != null) {
        showSnackBar(response[error].toString());
      }
      _changeAuthState(OtpState.Failed);
    }
  }

  Future<void> verifyOTP({required String otp}) async {
    _changeAuthState(OtpState.Verifying);
    Map<String, dynamic> response =
        await locator.get<OtpServiceViaEmail>().verifyOTP(email, otp);

    if (response[code] == 200) {
      showSnackBar(response[msg].toString());
      _changeAuthState(OtpState.Verified);
    } else {
      if (response[error] != null) {
        showSnackBar(response[error].toString());
      }
      _changeAuthState(OtpState.Unverified);
    }
  }

  Future<void> updatePassword({required String password}) async {
    Map<String, dynamic> response =
        await locator.get<OtpServiceViaEmail>().updatePassword(email, password);

    if (response[code] == 200) {
      showSnackBar(response[msg].toString());
    } else {
      if (response[error] != null) {
        showSnackBar(response[error].toString());
      }
    }
  }
}
