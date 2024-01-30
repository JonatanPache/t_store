import 'dart:ui';

import 'package:flutter/material.dart';

class TColors {
  TColors._();

  static const Color white = Color(0xFFF6F6F6);

  // app basic colors
  static const Color primary = Color(0xFF4b68ff);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);

  // text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  //background color
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // background container color
  static const Color lightContainer = TColors.light;
  static Color darkContainer = TColors.white.withOpacity(0.1);

  // button colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = TColors.textSecondary;
  static const Color buttonDisable = Color(0xFFC4C4C4);

  // border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // error and success
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  //neutral shades
static const Color black = Color(0xFF232323);
static const Color darkerGrey = Color(0xFF4F4F4F);
static const Color darkGrey = Color(0xFF939393);

}
