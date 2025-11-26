import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/User%20Profile/domain/entities/user_prtofile_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserProfileEntity>> getUserProfile(String userId);
  Future<Either<Failure, Unit>> updateUserProfile(
    String userId,
    Map<String, dynamic> profileData,
  );
  Future<Either<Failure, String>> uploadProfilePicture(String userId, String imagePath);
  Future<Either<Failure, Unit>> completeUserOnboarding(String userId);
}
