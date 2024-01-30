import 'package:flutter/material.dart';

class THelperFunctions {
  THelperFunctions._();

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // static Size screenSize(){
  //   return MediaQuery.of(Get).size;
  // }
}
