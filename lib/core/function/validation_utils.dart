import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class ValidationUtils {
  static bool isValidPhoneNumber(String phoneNumber, String dialCode) {
    try {
      final parsedPhoneNumber = PhoneNumber.parse('$dialCode$phoneNumber');
      return parsedPhoneNumber.isValid(type: PhoneNumberType.mobile);
    } catch (e) {
      return false;
  
  }
  }}
