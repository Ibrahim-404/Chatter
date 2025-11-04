import 'package:bloc/bloc.dart';
import 'package:chatter/core/function/logger.dart';
import 'package:chatter/feature/Authentication/domain/repository/domain_auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'send_varify_event.dart';
part 'send_varify_state.dart';

class SendVarifyBloc extends Bloc<SendVarifyEvent, SendVarifyState> {
  final AuthRepo authRepo;

  SendVarifyBloc({required this.authRepo}) : super(SendVarifyInitial()) {
    on<SendOtpEvent>((event, emit) async {
      logger.i("➡️ SendOtpEvent triggered with ${event.phoneNumber}");
      emit(SendLoading());
      final result = await authRepo.sendOtp(event.phoneNumber, event.dialCode);

      result.fold(
        (failure) {
          logger.e("❌ Send OTP failed: ${failure.message}");
          emit(SendFailure(failure.message));
        },
        (verificationId) {
          logger.i("✅ OTP sent successfully. Verification ID: $verificationId");
          emit(SendSuccess(verificationId: verificationId));
        },
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
