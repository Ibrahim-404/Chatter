part of 'profile_picture_bloc.dart';

sealed class ProfilePictureEvent extends Equatable {
  const ProfilePictureEvent();

  @override
  List<Object> get props => [];
}

final class SelectProfilePictureEvent extends ProfilePictureEvent {
  final String imageSource;
  const SelectProfilePictureEvent({required this.imageSource});
  @override
  List<Object> get props => [imageSource];
}

final class DefaultProfilePictureEvent extends ProfilePictureEvent {
  final String genderValue;
  const DefaultProfilePictureEvent({required this.genderValue});
  @override
  List<Object> get props => [genderValue];
}
