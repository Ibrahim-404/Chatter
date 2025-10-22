import 'package:chatter/core/feuille/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> sendOtp(String phoneNumber);
  Future<Either<Failure, void>> verifyOtp(String smsCode);
  Future<Either<Failure, void>> signOut();
}
