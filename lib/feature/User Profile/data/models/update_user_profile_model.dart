class UpdateUserProfileModel {
  final String userId;
  final String name;
  final String email;
  final String bio;

  UpdateUserProfileModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.bio,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'bio': bio,
    };
  }
}