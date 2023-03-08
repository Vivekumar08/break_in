import 'package:flutter/foundation.dart';
import 'constants.dart';
import '../locator.dart';
import '../services/api/api.dart';
import '../style/snack_bar.dart';

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

    print(response);

    if (response[code] == 200) {
      _email = email;
      _changeAuthState(OtpState.Sent);
    } else {
      if (response[msg] != null) {
        showSnackBar(response[msg].toString());
      }
      _changeAuthState(OtpState.Failed);
    }
  }

  Future<void> verifyOTP({required String otp}) async {
    _changeAuthState(OtpState.Verifying);
    Map<String, dynamic> response =
        await locator.get<OtpServiceViaEmail>().verifyOTP(otp);

    print(response);

    if (response[code] == 200) {
      _changeAuthState(OtpState.Verified);
    } else {
      if (response[msg] != null) {
        showSnackBar(response[msg].toString());
      }
      _changeAuthState(OtpState.Unverified);
    }
  }

  Future<void> updatePassword({required String password}) async {
    Map<String, dynamic> response =
        await locator.get<OtpServiceViaEmail>().updatePassword(password);

    print(response);

    if (response[code] == 200) {
      showSnackBar('Password changed successfully');
    } else {
      if (response[msg] != null) {
        showSnackBar(response[msg].toString());
      }
    }
  }
}
