import 'package:flutter/material.dart';

class UIConstants {
  static const LinearGradient checkBoxGradientDarkTheme = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xff2B2D37),
      Color(0xff262933),
    ],
  );

  static const LinearGradient checkBoxGradientLightTheme = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xffFCFCFC),
      Color(0xffF8F8F8),
    ],
  );
}
