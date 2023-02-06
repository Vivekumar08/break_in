import 'package:break_in/src/style/palette.dart';
import 'package:flutter/material.dart';

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
      color: Palette.text);

  static TextStyle get simptext => TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: _urbReg,
      color: Palette.text);
  static TextStyle get medText => TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      fontFamily: _urbMed,
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
