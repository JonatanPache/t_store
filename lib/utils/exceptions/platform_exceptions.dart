/// Custom exception class to handle various Firebase authentication-related errors.
class TPlatformException implements Exception {
  /// Th error code associated with the exception
  final String code;

  /// Constructor that takes an error code.
  TPlatformException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials. Please double-check your information.';
      case 'too-many-request':
        return 'Too many request. Please try again later.';
      case 'invalid-argument':
        return 'Invalid argument provided to the authentication method.';
      case 'invalid-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-phone-number':
        return 'Invalid login details. User not found.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance.';
      case 'session-cookie-expired':
        return 'The firebase session cookie has expired. Please sign in again.';
      case 'uid-already-exits':
        return 'The provided user ID is already in use by another user.';
      case 'sign_in_failed':
        return 'Sign in failed. Please try again.';
      case 'network-request-failed':
        return 'The Network request failed. Please check your internet connection.';
      case 'internal-error':
        return 'An internal authentication error occurred. Please try again later';
      case 'email-already-exists':
        return 'The email address already exists. Please use a different email.';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed in user.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email but different sign-in credentials.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance.';
      case 'expired-action-code':
        return 'The action code is invalid. Please check the code and try again.';
      case 'missing-action-code':
        return 'The action code is missing. Please provide a valid action code.';
      case 'user-token-expired':
        return 'The user\'s token has expired, and authentication is required. Please sign in again';
      case 'user-not-found':
        return 'No user found for the given email or UID.';
      case 'invalid-credential':
        return 'The supplied credential is malformed or has expired.';
      case 'user-token-revoked':
        return 'The user\'s token has expired, and authentication is required. Please sign in again.';
      case 'invalid-message-payload':
        return 'The email template verification message payload is invalid.';
      case 'missing-action-code':
        return 'The action code is missing. Please provide a valid action code.';
      case 'invalid-sender':
        return 'The email template sender is invalid. Please verify the sender\'s email';
      case 'user-not-found':
        return 'No user found for the given email or UID.';
      default:
        return 'An unexpected Firebase error ocurred. Please try again';
    }
  }
}
