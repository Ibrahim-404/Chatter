import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/User%20Profile/domain/entities/update_user_profile_entity.dart';
import 'package:chatter/feature/User%20Profile/domain/repository/ProfileRepository%20.dart';
import 'package:dartz/dartz.dart';

class UpdateUserProfileUseCase {
  final ProfileRepository repository;
  UpdateUserProfileUseCase(this.repository);
  Future<Either<Failure, Unit>> call(UpdateUserProfileEntity profileData) {
    return repository.updateUserProfile(profileData);
  }
}
