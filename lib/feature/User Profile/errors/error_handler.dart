import 'package:chatter/core/feuille/failure.dart';

class ErrorHandler implements Failure {
  @override
  final String message;
  ErrorHandler(this.message);

  serverError() {
    return ErrorHandler("A server error occurred. Please try again later.");
  }

  networkError() {
    return ErrorHandler(
      "No internet connection. Please check your network settings.",
    );
  }

  unknownError() {
    return ErrorHandler("An unknown error occurred. Please try again.");
  }
}
