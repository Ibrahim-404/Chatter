import 'package:bloc/bloc.dart';
import 'package:chatter/core/constants/assets.dart';
import 'package:chatter/feature/User%20Profile/domain/usecases/upload_profile_picture.dart';
import 'package:equatable/equatable.dart';

part 'profile_picture_event.dart';
part 'profile_picture_state.dart';

class ProfilePictureBloc
    extends Bloc<ProfilePictureEvent, ProfilePictureState> {
  final UploadProfilePictureUseCase uploadProfilePicture;

  ProfilePictureBloc(this.uploadProfilePicture)
    : super(ProfilePictureInitial()) {
    on<SelectProfilePictureEvent>((event, emit) async {
emit()

    });
    on<DefaultProfilePictureEvent>((event, emit) async {
      if (event.genderValue == 'Female') {
        emit(
          DefaultProfilePictureFemale(
            imageProfile: Assets.assetsanonymousFemaleUser,
          ),
        );
        return;
      } else if (event.genderValue == 'Male') {
        emit(
          DefaultProfilePictureMale(
            imageProfile: Assets.assetsanonymousMaleUser,
          ),
        );
        return;
      }
      emit(
        DefaultProfilePictureMale(imageProfile: Assets.assetsanonymousMaleUser),
      );
    });
  }
}

// Handle gallery permission and image selection
