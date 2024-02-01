import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TDeviceUtility {
  TDeviceUtility._();

  static double getScreenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static double getPixelRatio(BuildContext context){
      return MediaQuery.of(context).devicePixelRatio;
  }

  static double getStatusBarHeight(BuildContext context){
    return MediaQuery.of(context).padding.top;
  }

  static double getBottomNavigationBarHeight(){
    return kBottomNavigationBarHeight;
  }

  static double getAppBarHeight(){
    return kToolbarHeight;
  }

  static double getKeyboardHeight(){
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  static Future<bool> isKeyboardVisible() async {
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }
}