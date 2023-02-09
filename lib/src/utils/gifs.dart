import 'package:flutter/material.dart';

String _initialPath = 'assets/gifs';

class Gifs {
  static Image get hello => Image.asset("$_initialPath/hello.gif");
}
