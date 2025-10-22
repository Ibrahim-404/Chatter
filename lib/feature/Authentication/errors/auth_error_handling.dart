import 'package:chatter/core/feuille/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorHandler extends Failure {
  FirebaseErrorHandler(String message) : super(message);

  static Failure handleFirebaseAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-phone-number':
        return FirebaseErrorHandler('Invalid phone number format.');
      case 'too-many-requests':
        return FirebaseErrorHandler(
          'Too many requests. Please try again later.',
        );
      case 'quota-exceeded':
        return FirebaseErrorHandler('SMS quota exceeded. Try again later.');
      case 'session-expired':
        return FirebaseErrorHandler(
          'Session expired. Please request a new code.',
        );
      case 'invalid-verification-code':
        return FirebaseErrorHandler('Invalid verification code.');
      case 'network-request-failed':
        return FirebaseErrorHandler(
          'Network error. Please check your connection.',
        );
      case 'user-disabled':
        return FirebaseErrorHandler('This user account has been disabled.');
      default:
        return FirebaseErrorHandler('An unknown error occurred.');
    }
  }
}
