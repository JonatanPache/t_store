import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/loaders.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/models/user_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/network/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs; // observable for privacy policy acceptance
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // signup
  Future<void> signup() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog('We are processing your information', TImages.promoBanner1);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // form validation
      if (!signupFormKey.currentState!.validate()) return;

      // privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(title: 'Accept Privacy Policy', message: 'In order to create account, you must have to read and accept the Privacy Policy and Terms of Use.');
        return;
      }

      // register user in the firebase authentication and save user data in the firebase
      final user = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // save authentication
      // final newUser = UserModel();

      // show success message

      // move  to verify email screen

    } catch (e) {
      // show some generic error to the user
      TLoaders.errorSnackBar(title: e.toString());
    } finally {
      // remove loader
      TFullScreenLoader.stopLoading();
    }
  }
}