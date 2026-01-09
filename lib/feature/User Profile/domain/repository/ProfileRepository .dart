import 'package:chatter/core/feuille/failure.dart';
import 'package:chatter/feature/User%20Profile/domain/entities/update_user_profile_entity.dart';
import 'package:chatter/feature/User%20Profile/domain/entities/user_prtofile_entity.dart';
import 'package:chatter/feature/User%20Profile/domain/enums/image_source_type.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserProfileEntity>> getUserProfile(String userId);
  Future<Either<Failure, Unit>> updateUserProfile(
    UpdateUserProfileEntity profileData,
  );
  Future<Either<Failure, Unit>> uploadProfilePicture(
    String userId,
    ImageSourceType source,
  );
  Future<Either<Failure, Unit>> completeUserOnboarding(String userId);
}
