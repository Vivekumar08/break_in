import 'package:flutter/material.dart';

String _initialPath = 'assets/images';

class Images {
  static Image get onboarding =>
      Image.asset("$_initialPath/onboarding.png", scale: 4);
  static Image get successMark =>
      Image.asset("$_initialPath/Successmark.png", scale: 4);
  static Image get bg => Image.asset("$_initialPath/map.png", scale: 4);
  static Image get canteen =>
      Image.asset("$_initialPath/canteen.jpg", scale: 4);
  static Image get corners => Image.asset("$_initialPath/corner.jpg", scale: 4);
  static Image get others => Image.asset("$_initialPath/others.jpg", scale: 4);
  static Image get microCafe =>
      Image.asset("$_initialPath/microcafe.jpeg", scale: 4);
  static Image get hostelMess =>
      Image.asset("$_initialPath/mess.jpg", scale: 4);
  static Image get feeding =>
      Image.asset("$_initialPath/feeding.png", scale: 4, height: 100);
  static Image get sad => Image.asset("$_initialPath/sad.png", height: 40);
  static Image get tempFood => Image.asset("$_initialPath/rectangle_food.png");
  static Image get menu => Image.asset("$_initialPath/menu.png");
  static Image get happy => Image.asset("$_initialPath/happy.png", height: 40);
  static Image get maggi => Image.asset("$_initialPath/maggi.png", scale: 2);
}
