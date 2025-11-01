import 'package:bloc/bloc.dart';
import 'package:chatter/feature/Authentication/domain/repository/domain_auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'send_varify_event.dart';
part 'send_varify_state.dart';

class SendVarifyBloc extends Bloc<SendVarifyEvent, SendVarifyState> {
  final AuthRepo authRepo;

  SendVarifyBloc({required this.authRepo}) : super(SendVarifyInitial()) {
    on<SendOtpEvent>((event, emit) async {
      emit(SendLoading());
      final result = await authRepo.sendOtp(event.phoneNumber, event.dialCode);

      result.fold(
        (failure) => emit(SendFailure(failure.message)),
        (_) => emit(SendSuccess()),
      );
    });

    on<VerifyOtpEvent>((event, emit) async {
      emit(VerifyCodeLoading());
      final result = await authRepo.verifyOtp(event.otp, event.verificationId);
      result.fold(
        (failure) => emit(VerifyCodeFailure(failure.message)),
        (_) => emit(VerifyCodeSuccess()),
      );
    });
  }
}
