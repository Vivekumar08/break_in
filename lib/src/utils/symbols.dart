import 'package:flutter/material.dart';

String _initialPath = 'assets/icons';

class Symbols {
  static Image get googleIcon =>
      Image.asset("$_initialPath/google_ic.png", scale: 2);
  static Image get facebookIcon =>
      Image.asset("$_initialPath/facebook_ic.png", scale: 2);
  static Image get phoneIcon =>
      Image.asset("$_initialPath/phone_ic.png", scale: 2);
  static Image get mailIcon =>
      Image.asset("$_initialPath/mail_ic.png", scale: 2);
}
