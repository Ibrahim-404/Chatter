import 'package:chatter/feature/User%20Profile/data/models/update_user_profile_model.dart';
import 'package:chatter/feature/User%20Profile/data/models/user_profile_model.dart';

abstract class UserProfileRemoteDataSource {
  Future<UserProfileModel> getUserProfile(String userId);
  Future<void> updateUserProfilePicture(String userId, String imagePath);
  Future<void> editUserProfile(UpdateUserProfileModel profileData);
}
