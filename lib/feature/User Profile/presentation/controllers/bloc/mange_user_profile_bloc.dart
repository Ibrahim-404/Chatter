import 'package:bloc/bloc.dart';
import 'package:chatter/feature/User%20Profile/data/models/user_profile_model.dart';
import 'package:equatable/equatable.dart';

part 'mange_user_profile_event.dart';
part 'mange_user_profile_state.dart';

class MangeUserProfileBloc extends Bloc<MangeUserProfileEvent, MangeUserProfileState> {
  MangeUserProfileBloc() : super(MangeUserProfileInitial()) {
    on<MangeUserProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
