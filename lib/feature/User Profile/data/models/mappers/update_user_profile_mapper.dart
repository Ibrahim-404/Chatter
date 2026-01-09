import 'package:chatter/feature/User%20Profile/data/models/update_user_profile_model.dart';
import 'package:chatter/feature/User%20Profile/domain/entities/update_user_profile_entity.dart';

extension UpdateUserProfileMapper on UpdateUserProfileEntity {
  UpdateUserProfileModel toModel() {
    return UpdateUserProfileModel(
      userId: userId,
      name: name,
      email: email,
      bio: bio,
    );
  }
}