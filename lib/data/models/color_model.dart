import 'package:flutter/material.dart';

class ColorModel {
  MaterialColor themeColor;
  // Color? screenColorLight;
  Color? backgroundColorLight;
  Color? appBarColorLight;
  Color? appBarColorDark;
  Color? appBarShadowColorDark;

  ColorModel({
    required this.themeColor,
    // required this.screenColorLight,
    required this.backgroundColorLight,
    required this.appBarColorLight,
    required this.appBarColorDark,
    required this.appBarShadowColorDark,
  });
}
