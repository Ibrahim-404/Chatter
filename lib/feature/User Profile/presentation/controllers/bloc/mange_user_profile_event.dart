part of 'mange_user_profile_bloc.dart';

sealed class MangeUserProfileEvent extends Equatable {
  const MangeUserProfileEvent();
  @override
  List<Object> get props => [];

}
final class GetUserProfileEvent extends MangeUserProfileEvent {
  final String userId;
  const GetUserProfileEvent({required this.userId});
  @override
  List<Object> get props => [userId];
}
final class UpdateUserProfileEvent extends MangeUserProfileEvent {
  final String userId;
  final Map<String, dynamic> profileData;
  const UpdateUserProfileEvent({
    required this.userId,
    required this.profileData,
  });
  @override
  List<Object> get props => [userId, profileData];
}
final class UploadProfilePictureEvent extends MangeUserProfileEvent {
  final String userId;
  final String imagePath;
  const UploadProfilePictureEvent({
    required this.userId,
    required this.imagePath,
  });
  @override
  List<Object> get props => [userId, imagePath];
}
final class CompleteUserOnboardingEvent extends MangeUserProfileEvent {
  final String userId;
  const CompleteUserOnboardingEvent({required this.userId});
  @override
  List<Object> get props => [userId];
}


