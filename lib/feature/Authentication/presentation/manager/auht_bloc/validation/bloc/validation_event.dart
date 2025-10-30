part of 'validation_bloc.dart';

sealed class ValidationEvent extends Equatable {
  const ValidationEvent();

  @override
  List<Object> get props => [];
}

final class ValidatePhoneNumber extends ValidationEvent {
  final String phoneNumber;
  final String dialCode;

  const ValidatePhoneNumber(this.phoneNumber, this.dialCode);

  @override
  List<Object> get props => [phoneNumber, dialCode];
}
