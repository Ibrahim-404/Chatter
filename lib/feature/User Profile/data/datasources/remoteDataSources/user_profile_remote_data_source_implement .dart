import 'dart:io';
import 'package:chatter/feature/User%20Profile/data/datasources/remoteDataSources/user_profile_remote_data_source%20.dart';
import 'package:chatter/feature/User%20Profile/data/models/user_profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserProfileRemoteDataSourceImplementation
    implements UserProfileRemoteDataSource {
  SupabaseClient supabase = Supabase.instance.client;
  SupabaseStorageClient supabaseStorage = Supabase.instance.client.storage;
  @override
  Future<UserProfileModel> getUserProfile(String userId) async {
    final Map<String, dynamic> data =
        await supabase.from('users').select().eq('id', userId).single();
    return UserProfileModel.fromJson(data);
  }

  @override
  Future<void> updateUserProfilePicture(String userId, String imagePath) async {
    final String userProfile = imagePath;
    final file = File(imagePath);
    final fileName = '${userId}_profile_picture.png';
    await supabaseStorage.from('user_profile_pictures').upload(fileName, file);

    final getPictureUrl = supabaseStorage
        .from('user_profile_pictures')
        .getPublicUrl(fileName);

    await supabase
        .from('users')
        .update({'profile_photo_link': getPictureUrl})
        .eq('id', userId);
  }

  @override
  Future<void> editUserProfile(
    String userId,
    Map<String, dynamic> userProfileData,
  ) {
    return supabase.from('users').update(userProfileData).eq('id', userId);
  }
}
