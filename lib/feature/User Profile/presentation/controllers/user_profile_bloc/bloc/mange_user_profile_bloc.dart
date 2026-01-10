import 'package:bloc/bloc.dart';
import 'package:chatter/feature/User%20Profile/domain/entities/update_user_profile_entity.dart';
import 'package:chatter/feature/User%20Profile/domain/entities/user_prtofile_entity.dart';
import 'package:chatter/feature/User%20Profile/domain/usecases/complete_user_onborading.dart';
import 'package:chatter/feature/User%20Profile/domain/usecases/get_user_prtfile.dart';
import 'package:chatter/feature/User%20Profile/domain/usecases/update_user_profile.dart';
import 'package:equatable/equatable.dart';
part 'mange_user_profile_event.dart';
part 'mange_user_profile_state.dart';

class MangeUserProfileBloc
    extends Bloc<MangeUserProfileEvent, MangeUserProfileState> {
  final GetUserProfileUseCase getUserProfile;
  final UpdateUserProfileUseCase updateUserProfile;
  final CompleteUserOnboardingUseCase completeUserOnboarding;
  MangeUserProfileBloc(
    this.getUserProfile,
    this.updateUserProfile,
    this.completeUserOnboarding,
  ) : super(MangeUserProfileInitial()) {
    on<GetUserProfileEvent>((event, emit) async {
      emit(GetUserProfileLoading());
      try {
        final userProfile = await getUserProfile(event.userId);
        userProfile.fold(
          (failure) {
            emit(GetUserProfileFailure(errorMessage: failure.toString()));
          },
          (profile) {
            emit(GetUserProfileSuccess(userProfile: profile));
          },
        );
      } on Exception catch (e) {
        emit(GetUserProfileFailure(errorMessage: e.toString()));
      }
    });
    on<UpdateUserProfileEvent>((event, emit) async {
      emit(UpdateUserProfileLoading());
      try {
        final result = await updateUserProfile(event.profileData);
        result.fold(
          (failure) {
            emit(UpdateUserProfileFailure(errorMessage: failure.toString()));
          },
          (_) {
            emit(UpdateUserProfileSuccess());
          },
        );
      } on Exception catch (e) {
        emit(UpdateUserProfileFailure(errorMessage: e.toString()));
      }
    });

    on<CompleteUserOnboardingEvent>((event, emit) async {
      emit(CompleteUserOnboardingLoading());
      try {
        final result = await completeUserOnboarding(event.userId);
        result.fold(
          (failure) {
            emit(
              CompleteUserOnboardingFailure(errorMessage: failure.toString()),
            );
          },
          (_) {
            emit(CompleteUserOnboardingSuccess());
          },
        );
      } on Exception catch (e) {
        emit(CompleteUserOnboardingFailure(errorMessage: e.toString()));
      }
    });
  }
}
