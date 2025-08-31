import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");

    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
      return int.parse(hexColor, radix: 16);
    } else {
      hexColor = "0x$hexColor";
      return int.parse(hexColor);
    }
  }

  HexColor({required String hexColor}) : super(_getColorFromHex(hexColor));
}
