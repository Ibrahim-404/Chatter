class UpdateUserProfileEntity {
  final String userId;
  final String name;
  final String email;
  final String bio;

  UpdateUserProfileEntity({
    required this.userId,
    required this.name,
    required this.email,
    required this.bio,
  });
}
