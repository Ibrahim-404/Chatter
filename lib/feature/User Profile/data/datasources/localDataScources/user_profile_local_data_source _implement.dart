import 'package:chatter/core/database/base_local_data_source%20.dart';
import 'package:chatter/core/database/database_helper.dart';
import 'package:chatter/feature/User%20Profile/data/datasources/localDataScources/user_profile_local_data_source%20.dart';
import 'package:chatter/feature/User%20Profile/data/models/user_profile_model.dart';

class UserProfileLocalDataSourceImplement extends BaseLocalDataSource
    implements UserProfileLocalDataSource {
  UserProfileLocalDataSourceImplement()
    : super(databaseHelper: DatabaseHelper());
  @override
  Future<void> cacheUserProfile(UserProfileModel userProfile) async {
    final db = await getDatabase();
    await db.insert('users', {
      'id': userProfile.userId,
      'name': userProfile.name,
      'email': userProfile.email,
      'phone': userProfile.phoneNumber,
      'bio': userProfile.bio,
      'avatar_url': userProfile.profilePictureUrl,
    });
  }

  @override
  Future<UserProfileModel> getCachedUserProfile(String userId) async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [userId],
    );

    if (maps.isNotEmpty) {
      return UserProfileModel(
        userId: maps[0]['id'],
        name: maps[0]['name'],
        email: maps[0]['email'] ?? '',
        phoneNumber: maps[0]['phone'],
        bio: maps[0]['bio'] ?? '',
        profilePictureUrl: maps[0]['avatar_url'],
        gender: maps[0]['gender'] ?? '',
      );
    } else {
      throw Exception('No cached user profile found for userId: $userId');
    }
  }
}
