import 'package:flutter/material.dart';
import 'package:t_store/utils/colors.dart';

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: TColors.light,
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizontalProductShadow = BoxShadow(
      color: TColors.light,
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
