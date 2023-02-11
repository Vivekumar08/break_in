import 'package:flutter/material.dart';

String _initialPath = 'assets/icons';

class Symbols {
  static Image get passwordIcon =>
      Image.asset("$_initialPath/fluent_eye-20-filled.png", scale: 2);
  static Image get googleIcon =>
      Image.asset("$_initialPath/google_ic.png", scale: 2);
  static Image get facebookIcon =>
      Image.asset("$_initialPath/facebook_ic.png", scale: 2);
  static Image get phoneIcon =>
      Image.asset("$_initialPath/phone_ic.png", scale: 2);
  static Image get mailIcon =>
      Image.asset("$_initialPath/mail_ic.png", scale: 2);
  static Image get locationMark =>
      Image.asset("$_initialPath/Vector.png", scale: 2);
  static Image get searchIcon =>
      Image.asset("$_initialPath/search.png", scale: 2);
}
