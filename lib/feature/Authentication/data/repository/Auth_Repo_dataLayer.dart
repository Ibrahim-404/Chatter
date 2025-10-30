import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/Authentication/domain/repository/domain_auth_repo.dart';
import 'package:chatter/feature/Authentication/errors/auth_error_handling.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoDataLayer implements AuthRepo {
  String? verificationId;

  @override
  Future<Either<Failure, void>> sendOtp(
    String phoneNumber,
    String dialCode,
  ) async {
    try {
      final String fullPhoneNumber = ('$dialCode$phoneNumber');
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.verifyPhoneNumber(
        phoneNumber: fullPhoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException error) {
          throw FirebaseAuthException(code: error.code, message: error.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );

      return const Right(unit);
    } catch (e) {
      return Left(FirebaseErrorHandler(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> verifyOtp(
    String smsCode,
    String verificationId,
  ) async {
    try {
      final auth = FirebaseAuth.instance;

      final credential = PhoneAuthProvider.credential(
        verificationId: this.verificationId!,
        smsCode: smsCode,
      );

      await auth.signInWithCredential(credential);

      final user = auth.currentUser;
      if (user == null) {
        return Left(FirebaseErrorHandler("User not found after verification"));
      }

      await Supabase.instance.client.from('users').upsert({
        'id': user.uid,
        'phone_number': user.phoneNumber,
      });

      return const Right(unit);
    } catch (e) {
      return Left(FirebaseErrorHandler(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return const Right(unit);
    } catch (e) {
      return Left(FirebaseErrorHandler(e.toString()));
    }
  }
}
