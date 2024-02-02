import 'package:get/get.dart';

class TValidator {
  static String? validateEmail(String? value ){
    if(value == null || value.isEmpty) {
      return 'Email is required';
    }
  }
}