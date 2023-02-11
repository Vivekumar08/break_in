import 'package:flutter/material.dart';

String _initialPath = 'assets/gifs';

class Gifs {
  static Image get hello => Image.asset("$_initialPath/hello.gif");
  static Image get canteen => Image.asset("$_initialPath/canteen.gif");
  static Image get mess => Image.asset("$_initialPath/mess.gif");
  static Image get cafe => Image.asset("$_initialPath/cafe.gif");
  static Image get corners => Image.asset("$_initialPath/corners.gif");
}
