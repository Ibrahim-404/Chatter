import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/User%20Profile/domain/entities/user_prtofile_entity.dart';
import 'package:chatter/feature/User%20Profile/domain/repository/ProfileRepository%20.dart';
import 'package:dartz/dartz.dart';

class GetUserProfileUseCase {
  ProfileRepository repository;
  GetUserProfileUseCase(this.repository);
  Future<Either<Failure, UserProfileEntity>> call(String userId) {
    return repository.getUserProfile(userId);
  }
}
