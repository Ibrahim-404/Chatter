import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/User%20Profile/domain/repository/ProfileRepository%20.dart';
import 'package:dartz/dartz.dart';

class CompleteUserOnboardingUseCase {
  final ProfileRepository repository;
  CompleteUserOnboardingUseCase(this.repository);
  Future<Either<Failure, Unit>> call(String userId) {
    return repository.completeUserOnboarding(userId);
  }
}