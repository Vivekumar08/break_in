import 'package:flutter/material.dart';
import '../style/palette.dart';

const String _urbReg = "Urbanist";
const String _urbBold = "Urbanist_Bold";
const String _urbSemiBold = "Urbanist_SemiBold";
const String _urbMed = "Urbanist_Medium";
const String _urbLight = "Urbanist_Light";

class Fonts {
  static TextStyle get title => TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      fontFamily: _urbBold,
      height: 1.3,
      letterSpacing: -1,
      color: Palette.text);

  static TextStyle get simText => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: _urbReg,
      color: Palette.text);
  static TextStyle get medText => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: _urbMed,
      height: 1.5,
      color: Palette.text);
  static TextStyle get lightText => TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      fontFamily: _urbLight,
      color: Palette.text);

  static TextStyle get buttonText => TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      fontFamily: _urbSemiBold,
      color: Palette.background_2);
}
