import 'package:chatter/core/feuille/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> sendOtp(String phoneNumber, String dialCode);
  Future<Either<Failure, void>> verifyOtp(
    String smsCode,
    String verificationId,
  );
  Future<Either<Failure, void>> signOut();
}
