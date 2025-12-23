import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/User%20Profile/domain/repository/ProfileRepository%20.dart';
import 'package:dartz/dartz.dart';

class UpdateUserProfileUseCase {
  final ProfileRepository repository;
  UpdateUserProfileUseCase(this.repository);
  Future<Either<Failure, Unit>> call(
    String userId,
    Map<String, dynamic> profileData,
  ) {
    return repository.updateUserProfile(userId, profileData);
  }
}
