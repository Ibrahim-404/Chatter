import 'package:chatter/core/constants/assets.dart';
import 'package:chatter/core/widget/custom_notification_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class ShowMyBottomSheet extends StatefulWidget {
  const ShowMyBottomSheet({super.key});

  @override
  State<ShowMyBottomSheet> createState() => _ShowMyBottomSheetState();
}

class _ShowMyBottomSheetState extends State<ShowMyBottomSheet> {
  TextEditingController _PhoneNumber = TextEditingController();
  bool _isValid = false;
  String _selectedDialCode = '+20';
  late ValueNotifier<bool> valueNotifierisValid;
  // late ValueNotifier<String> valueselectedDialCode;

  @override
  void initState() {
    super.initState();
    _PhoneNumber.addListener(_validtePhoneNumber);
    valueNotifierisValid = ValueNotifier(_isValid);
    // valueselectedDialCode = ValueNotifier(_selectedDialCode);
  }

  void _validtePhoneNumber() {
    try {
      final phoneNumber = PhoneNumber.parse(
        '${_selectedDialCode}${_PhoneNumber.text.trim()}',
      );
      // Check if the phone number is valid
      valueNotifierisValid.value = phoneNumber.isValid(
        type: PhoneNumberType.mobile,
      );
    } catch (e) {
      valueNotifierisValid.value = false;
      // Handle parsing error if needed
    }
  }

  @override
  void dispose() {
    _PhoneNumber.dispose();
    valueNotifierisValid.dispose();
    // valueselectedDialCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 40),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome to Chatter!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Your journey to seamless communication starts here. Let's get you set up with your profile.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text("phone number"),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CountryCodePicker(
                    onChanged: (country) {
                      // Update the selected dial code when a country is selected
                      _selectedDialCode = country.dialCode!;

                      _validtePhoneNumber(); // Re-validate the phone number
                    },
                    initialSelection: "EG",
                    favorite: const ["+20", "EG"],
                    showCountryOnly: false,
                    showFlag: true,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    onTapUpOutside: (_)=>FocusManager.instance.primaryFocus?.unfocus(),
                    keyboardType: TextInputType.phone,
                    controller: _PhoneNumber,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                      labelText: "** **** ***",
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: InkWell(
                onTap: () {
                  if (valueNotifierisValid.value) {
                  
                    showCustomNotification(
                      context: context,
                      title: "Chatter",
                      message: "Check Your SMS for verification code",
                      imagePath: Assets.assetsIconsChat,
                    );
                  } else {
                    // Show an error message or handle invalid input
                    print('Invalid phone number');
                  }
                },
                child: ValueListenableBuilder<bool>(
                  valueListenable: valueNotifierisValid,
                  builder: (context, isValid, child) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 50,
                      decoration: BoxDecoration(
                        color: isValid ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
