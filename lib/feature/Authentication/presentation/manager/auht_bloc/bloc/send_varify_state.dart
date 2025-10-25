part of 'send_varify_bloc.dart';

sealed class SendVarifyState extends Equatable {
  const SendVarifyState();
  
  @override
  List<Object> get props => [];
}

final class SendVarifyInitial extends SendVarifyState {}
final class SendLoading extends SendVarifyState {}
final class SendSuccess extends SendVarifyState {}
final class SendFailure extends SendVarifyState {
  final String errorMessage;

  const SendFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
final class SendNetworkError extends SendVarifyState {
  final String errorMessage;

  const SendNetworkError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
final class SendServerError extends SendVarifyState {
  final String errorMessage;

  const SendServerError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
final class verifyCodeLoading extends SendVarifyState{}
final class verifyCodeSuccess extends SendVarifyState{}
final class verifyCodeFailure extends SendVarifyState {}

