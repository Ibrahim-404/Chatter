import 'package:chatter/feature/Authentication/domain/repository/domain_auth_repo.dart';

class SignOutUseCase {
  AuthRepo authRepo;

  SignOutUseCase(this.authRepo);

  Future<void> call() async {
    await authRepo.signOut();
  }
}
