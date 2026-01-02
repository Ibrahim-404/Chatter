import 'package:chatter/feature/User%20Profile/data/models/user_profile_model.dart';

abstract class UserProfileRemoteDataSource {
  Future<UserProfileModel> getUserProfile(String userId);
  Future<void> updateUserProfilePicture(String userId, String imagePath);
  Future<void> editUserProfile(
    String userId,
    Map<String, dynamic> userProfileData,
  );
}
