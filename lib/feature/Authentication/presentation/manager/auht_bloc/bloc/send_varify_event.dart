part of 'send_varify_bloc.dart';

sealed class SendVarifyEvent extends Equatable {
  const SendVarifyEvent();
  @override
  List<Object> get props => [];
}
class SendOtpEvent extends SendVarifyEvent {
  final String phoneNumber;
  const SendOtpEvent({required this.phoneNumber});
  @override
  List<Object> get props => [phoneNumber];
}
class VerifyOtpEvent extends SendVarifyEvent {
  final String otp;
  const VerifyOtpEvent({required this.otp});
  @override
  List<Object> get props => [otp];
}