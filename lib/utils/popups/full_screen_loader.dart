import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TFullScreenLoader {
  // open a full-screen loading dialog with a given text and animation
  // this method doesnt return anything

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context:
          Get.overlayContext!, // use get.overlayContext for overlay dialogs
      barrierDismissible:
          false, //the dialog cant be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // disable popping with the back button
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!) ? TColors.dark : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  /// Stop the currently open loading dialog
  /// This method doesn't return anything
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop(); // close the dialog using navigator
  }
}
