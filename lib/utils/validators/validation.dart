
class TValidator {
  static String? validateEmail(String? value ){
    if(value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if(!emailRegExp.hasMatch(value)){
      return 'Invalid email';
    }

    return null;
  }

  static String? validatePassword(String? value){
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    if (value.length < 6){
      return 'Password must be at least 6 characters long.';
    }
    return null;
  }
}