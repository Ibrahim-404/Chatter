class UserProfileEntity {
  String userId;
  String name;
  String bio;
  String phoneNumber;
  String profilePictureUrl;
  String email;
  UserProfileEntity({
    required this.userId,
    required this.name,
    required this.bio,
    required this.phoneNumber,
    required this.profilePictureUrl,
    required this.email,
  });
}
