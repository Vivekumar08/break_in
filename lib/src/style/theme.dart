import 'package:flutter/material.dart';
import 'palette.dart';
import 'fonts.dart';

final ThemeData theme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Palette.white,
    foregroundColor: Palette.text,
    elevation: 0,
    iconTheme: IconThemeData(color: Palette.iconsCol, size: 19.0),
    titleTextStyle: Fonts.textButton.copyWith(color: Palette.text),
    titleSpacing: 4.0,
    centerTitle: false,
    actionsIconTheme: IconThemeData(color: Palette.text, size: 24.0),
  ),
  scaffoldBackgroundColor: Palette.white,
);
