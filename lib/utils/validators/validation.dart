
class TValidator {

  // empty text validation
  static String? validateEmptyText(String? fieldName, String? value ){
    if(value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validateEmail(String? value ){
    if(value == null || value.isEmpty) {
      return 'Email is required';
    }

    // regular expression for email verification
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if(!emailRegExp.hasMatch(value)){
      return 'Invalid email address';
    }

    return null;
  }

  static String? validatePassword(String? value){
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // check for minimum password length
    if (value.length < 6){
      return 'Password must be at least 6 characters long.';
    }

    // check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))){
      return 'Password must contain at least one uppercase letter.';
    }

    // check for numbers
    if (!value.contains(RegExp(r'[0-9]'))){
      return 'Password must contain at least one number.';
    }

    // check for special character
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
      return 'Password must contain at least one special character.';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is required.';
    }

    final phoneRegExp = RegExp(r'^\d{8}$');

    if (!phoneRegExp.hasMatch(value)){
      return 'Invalid phone number format (8 digits required)';
    }

    return null;

  }
}