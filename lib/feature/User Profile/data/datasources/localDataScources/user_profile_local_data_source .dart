import 'package:chatter/feature/User%20Profile/data/models/user_profile_model.dart';

abstract class UserProfileLocalDataSource {
  Future<UserProfileModel> getCachedUserProfile(String userId);
  Future<void> cacheUserProfile(UserProfileModel userProfile);
}
