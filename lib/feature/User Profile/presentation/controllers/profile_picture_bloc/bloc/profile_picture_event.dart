part of 'profile_picture_bloc.dart';

sealed class ProfilePictureEvent extends Equatable {
  const ProfilePictureEvent();

  @override
  List<Object> get props => [];
}

final class SelectProfilePictureEvent extends ProfilePictureEvent {
  final String userid;
  final ImageSourceType source;
  const SelectProfilePictureEvent({required this.userid, required this.source});
  @override
  List<Object> get props => [userid, source];
}

final class DefaultProfilePictureEvent extends ProfilePictureEvent {
  final String genderValue;
  const DefaultProfilePictureEvent({required this.genderValue});
  @override
  List<Object> get props => [genderValue];
}
