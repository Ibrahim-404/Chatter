part of 'profile_picture_bloc.dart';

sealed class ProfilePictureEvent extends Equatable {
  const ProfilePictureEvent();

  @override
  List<Object> get props => [];
}

final class SelectProfilePictureEvent extends ProfilePictureEvent {
  final String imagePath;
  final String userId;
  const SelectProfilePictureEvent({
    required this.imagePath,
    required this.userId,
  });
  @override
  List<Object> get props => [imagePath, userId];
}
