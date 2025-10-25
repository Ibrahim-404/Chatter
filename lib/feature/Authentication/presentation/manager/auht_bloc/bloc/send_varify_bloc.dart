import 'package:bloc/bloc.dart';
import 'package:chatter/feature/Authentication/data/repository/Auth_Repo_dataLayer.dart';
import 'package:equatable/equatable.dart';
part 'send_varify_event.dart';
part 'send_varify_state.dart';

class SendVarifyBloc extends Bloc<SendVarifyEvent, SendVarifyState> {
  AuthRepoDataLayer authRepo;
  SendVarifyBloc({required this.authRepo}) : super(SendVarifyInitial()) {
    on<SendOtpEvent>((event, emit) async {
      final result = await authRepo.sendOtp(event.phoneNumber, "+20");
      emit(SendLoading());
      result.fold(
        (failure) {
          emit(SendFailure(failure.message));
        },
        (success) {
          emit(SendSuccess());
        },
      );
    });
  }
}
