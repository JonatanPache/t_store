/// Custom exception class to handle various Firebase authentication-related errors.
class TFirebaseException implements Exception {
  /// Th error code associated with the exception
  final String code;

  /// Constructor that takes an error code.
  TFirebaseException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'unknown':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please check your custom token';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please use a valid email.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance.';
      case 'invalid-credential':
        return 'The supplied credential is malformed or has expired.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';
      case 'captcha-check-failed':
        return 'The reCAPTCHA response is invalid. Please try again.';
      case 'app-not-authorized':
        return 'The app is not authorized to use Firebase Authentication with the provided API key.';
      case 'keychain-error':
        return 'A keychain error occurred. Pleased.';
      case 'internal-error':
        return 'An internal authentication error occurred. Please try again later.';
      case 'invalid-app-credential':
        return 'A keychain error occurred. Pleased.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      default:
        return 'An unexpected Firebase error occurred. Please try again.';
    }
  }
}
