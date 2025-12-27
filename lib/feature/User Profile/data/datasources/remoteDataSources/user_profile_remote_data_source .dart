abstract class UserProfileRemoteDataSource {
  Future<Map<String, dynamic>> getUserProfile(String userId);
  Future<void> updateUserProfile(String userId, String userProfile);
}
