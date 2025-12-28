import 'package:chatter/feature/User%20Profile/domain/entities/user_prtofile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    required super.name,
    required super.bio,
    required super.phoneNumber,
    required super.userId,
    required super.profilePictureUrl,
    required super.email,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'],
      bio: json['bio'],
      phoneNumber: json['phoneNumber'],
      userId: json['userId'],
      email: json['email'],
      profilePictureUrl: json['profilePictureUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'bio': bio,
      'phoneNumber': phoneNumber,
      'userId': userId,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}
