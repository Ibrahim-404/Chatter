part of 'mange_user_profile_bloc.dart';

sealed class MangeUserProfileState extends Equatable {
  const MangeUserProfileState();

  @override
  List<Object> get props => [];
}

final class MangeUserProfileInitial extends MangeUserProfileState {}

final class GetUserProfileLoading extends MangeUserProfileState {}

final class GetUserProfileSuccess extends MangeUserProfileState {
  final UserProfileEntity userProfile;
  const GetUserProfileSuccess({required this.userProfile});
  @override
  List<Object> get props => [userProfile];
}

final class GetUserProfileFailure extends MangeUserProfileState {
  final String errorMessage;
  const GetUserProfileFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class UpdateUserProfileLoading extends MangeUserProfileState {}

final class UpdateUserProfileSuccess extends MangeUserProfileState {}

final class UpdateUserProfileFailure extends MangeUserProfileState {
  final String errorMessage;
  const UpdateUserProfileFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class UploadProfilePictureLoading extends MangeUserProfileState {}

final class UploadProfilePictureSuccess extends MangeUserProfileState {}

final class UploadProfilePictureFailure extends MangeUserProfileState {
  final String errorMessage;
  const UploadProfilePictureFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class CameraPermissionDenied extends MangeUserProfileState {}

final class GalleryPermissionDenied extends MangeUserProfileState {}

final class UnknownPermissionDenied extends MangeUserProfileState {}

final class ProfileImageSelected extends MangeUserProfileState {
  final String imagePath;
  const ProfileImageSelected({required this.imagePath});
  @override
  List<Object> get props => [imagePath];
}

final class ProfileImageSelectionCancelled extends MangeUserProfileState {}

final class ProfileImageSelectionError extends MangeUserProfileState {
  final String errorMessage;
  const ProfileImageSelectionError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class ProfileImageReset extends MangeUserProfileState {}

final class ProfileImageUploading extends MangeUserProfileState {}

final class ProfileImageUploadSuccess extends MangeUserProfileState {
  final String imageUrl;
  const ProfileImageUploadSuccess({required this.imageUrl});
  @override
  List<Object> get props => [imageUrl];
}

final class CompleteUserOnboardingLoading extends MangeUserProfileState {}

final class CompleteUserOnboardingSuccess extends MangeUserProfileState {}

final class CompleteUserOnboardingFailure extends MangeUserProfileState {
  final String errorMessage;
  const CompleteUserOnboardingFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
