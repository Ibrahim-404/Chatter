part of 'mange_user_profile_bloc.dart';

sealed class MangeUserProfileState extends Equatable {
  const MangeUserProfileState();
  
  @override
  List<Object> get props => [];
}

final class MangeUserProfileInitial extends MangeUserProfileState {}
final class GetUserProfileLoading extends MangeUserProfileState {}
final class GetUserProfileSuccess extends MangeUserProfileState {
  final  UserProfileModel userProfile;
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
final class CompleteUserOnboardingLoading extends MangeUserProfileState {}
final class CompleteUserOnboardingSuccess extends MangeUserProfileState {}
final class CompleteUserOnboardingFailure extends MangeUserProfileState {
  final String errorMessage;
  const CompleteUserOnboardingFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}