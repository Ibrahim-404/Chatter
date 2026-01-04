part of 'profile_picture_bloc.dart';

sealed class ProfilePictureState extends Equatable {
  const ProfilePictureState();

  @override
  List<Object> get props => [];
}

final class ProfilePictureInitial extends ProfilePictureState {}

final class UploadProfilePictureLoading extends ProfilePictureState {}

final class UploadProfilePictureSuccess extends ProfilePictureState {}

final class UploadProfilePictureFailure extends ProfilePictureState {
  final String errorMessage;
  const UploadProfilePictureFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class CameraPermissionDenied extends ProfilePictureState {}

final class GalleryPermissionDenied extends ProfilePictureState {}

final class UnknownPermissionDenied extends ProfilePictureState {}

final class ProfileImageSelectionCancelled extends ProfilePictureState {}

final class ProfileImageSelectionError extends ProfilePictureState {
  final String errorMessage;
  const ProfileImageSelectionError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class ProfileImageReset extends ProfilePictureState {}

final class ProfileImageUploading extends ProfilePictureState {}

final class ProfileImageUploadSuccess extends ProfilePictureState {
  final String imageUrl;
  const ProfileImageUploadSuccess({required this.imageUrl});
  @override
  List<Object> get props => [imageUrl];
}

final class ProfileImageSelected extends ProfilePictureState {
  final String imagePath;
  const ProfileImageSelected({required this.imagePath});
  @override
  List<Object> get props => [imagePath];
}
