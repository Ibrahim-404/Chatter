part of 'send_varify_bloc.dart';

abstract class SendVarifyEvent extends Equatable {
  const SendVarifyEvent();

  @override
  List<Object?> get props => [];
}

class SendOtpEvent extends SendVarifyEvent {
  final String phoneNumber;
  final String dialCode;

  const SendOtpEvent({required this.phoneNumber, required this.dialCode});

  @override
  List<Object?> get props => [phoneNumber, dialCode];
}

class VerifyOtpEvent extends SendVarifyEvent {
  final String otp;
  final String verificationId;

  const VerifyOtpEvent({required this.otp, required this.verificationId});

  @override
  List<Object?> get props => [otp, verificationId];
}
