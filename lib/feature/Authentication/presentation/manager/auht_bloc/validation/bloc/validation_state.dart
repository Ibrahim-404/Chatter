part of 'validation_bloc.dart';

sealed class ValidationState extends Equatable {
  const ValidationState();

  @override
  List<Object> get props => [];
}

final class ValidationInitial extends ValidationState {}

final class NumberPhoneValidation extends ValidationState {
  final bool isValid;

  const NumberPhoneValidation(this.isValid);

  @override
  List<Object> get props => [isValid];
}

