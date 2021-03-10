

import 'package:flutter/material.dart';

class AppColors {

  static Color navBgColor = HexColor("E52D21");
  static Color mainColor = HexColor("E52D21");
  static Color thinGrey = HexColor("FAFAFA");

}

class HexColor extends Color {

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

}