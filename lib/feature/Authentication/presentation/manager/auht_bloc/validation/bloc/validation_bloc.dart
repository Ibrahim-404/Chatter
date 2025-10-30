import 'package:bloc/bloc.dart';
import 'package:chatter/core/function/validation_utils.dart';
import 'package:equatable/equatable.dart';

part 'validation_event.dart';
part 'validation_state.dart';

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  ValidationBloc() : super(ValidationInitial()) {
    on<ValidationEvent>((event, emit) {
      if (event is ValidatePhoneNumber) {
        final isValid = ValidationUtils.isValidPhoneNumber(
          event.phoneNumber,
          event.dialCode,
        );
        emit(NumberPhoneValidation(isValid));
      }
    });
  }
}
