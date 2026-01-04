import 'package:bloc/bloc.dart';
import 'package:chatter/feature/User%20Profile/domain/usecases/upload_profile_picture.dart';
import 'package:equatable/equatable.dart';

part 'profile_picture_event.dart';
part 'profile_picture_state.dart';

class ProfilePictureBloc
    extends Bloc<ProfilePictureEvent, ProfilePictureState> {
   final UploadProfilePictureUseCase uploadProfilePicture;

  ProfilePictureBloc(this.uploadProfilePicture) : super(ProfilePictureInitial()) {
    on<SelectProfilePictureEvent>((event, emit)async {
      emit(UploadProfilePictureLoading());
     final result = await uploadProfilePicture(event.imagePath , event.userId);
     result.fold(
          (failure) {
            emit(UploadProfilePictureFailure(errorMessage: failure.toString()));
          },
          (success) {
            emit(UploadProfilePictureSuccess());
          },
        );
    });
  }
}
