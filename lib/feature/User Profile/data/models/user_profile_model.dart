class UserProfileModel {
  final String name;
  final String bio;
  final String phoneNumber;
  final String userId;
  final String email;
  final String profilePictureUrl;
  final String gender;
  UserProfileModel({
    required this.name,
    required this.bio,
    required this.phoneNumber,
    required this.userId,
    required this.email,
    required this.profilePictureUrl,
    required this.gender,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> fromJson) {
    return UserProfileModel(
      name: fromJson['name'],
      bio: fromJson['bio'],
      phoneNumber: fromJson['phoneNumber'],
      userId: fromJson['userId'],
      email: fromJson['email'],
      profilePictureUrl: fromJson['profilePictureUrl'],
      gender: fromJson['gender'],
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

  Map<String, dynamic> updateUserProfileModel() {
    return {
      'name': name,
      'bio': bio,
      'phoneNumber': phoneNumber,
      'id': userId,
      'email': email,
      'profile_photo_link': profilePictureUrl,
    };
  }
}
