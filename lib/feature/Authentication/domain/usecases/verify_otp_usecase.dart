import 'package:chatter/feature/Authentication/domain/repository/domain_auth_repo.dart';

class VerifyOtpUseCase {
  AuthRepo authRepo;

  VerifyOtpUseCase(this.authRepo);

  Future<void> call(String smsCode) async {
    await authRepo.verifyOtp(smsCode);
  }
}
