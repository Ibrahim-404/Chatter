import 'package:chatter/feature/User%20Profile/domain/entities/user_prtofile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    required super.name,
    required super.bio,
    required super.phoneNumber, required super.userId, required super.profilePictureUrl,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'],
      bio: json['bio'],
      phoneNumber: json['phoneNumber'],
      userId: json['userId'],
      profilePictureUrl: json['profilePictureUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'bio': bio,
      'phoneNumber': phoneNumber,
    };
  }
 
}
