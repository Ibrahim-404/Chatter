import 'package:chatter/feature/Authentication/domain/repository/domain_auth_repo.dart';

class SendOtpUseCase {
  final AuthRepo authRepo;

  SendOtpUseCase(this.authRepo);

  Future<void> call(String phoneNumber) {
    if(phoneNumber.isEmpty){
      throw Exception("Phone number cannot be empty");
    }
    return authRepo.sendOtp(phoneNumber);
  }
}
