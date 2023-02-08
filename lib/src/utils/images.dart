import 'package:flutter/material.dart';

String _initialPath = 'assets/images';

class Images {
  static Image get onboarding =>
      Image.asset("$_initialPath/onboarding.png", scale: 4);
  static Image get successMark =>
      Image.asset("$_initialPath/successMark.png", scale: 4);
  static Image get bg =>
      Image.asset("$_initialPath/map.png", scale: 4);
}
