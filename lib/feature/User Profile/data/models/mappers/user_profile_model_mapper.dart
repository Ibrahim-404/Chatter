import 'package:chatter/feature/User%20Profile/data/models/user_profile_model.dart';
import 'package:chatter/feature/User%20Profile/domain/entities/user_prtofile_entity.dart';

extension UserProfileModelMapper on UserProfileModel {
  UserProfileEntity toEntity() {
    return UserProfileEntity(
      name: name,
      bio: bio,
      phoneNumber: phoneNumber,
      userId: userId,
      email: email,
      profilePictureUrl: profilePictureUrl,
    );
  }
}
