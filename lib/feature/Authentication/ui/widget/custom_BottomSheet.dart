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

  void _validtePhoneNumber() {
    try {
      final phoneNumber = PhoneNumber.parse(
        '${_selectedDialCode}${_PhoneNumber.text.trim()}',
      );
      setState(() {
        _isValid = phoneNumber.isValid(type: PhoneNumberType.mobile);
      });
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    _PhoneNumber.addListener(_validtePhoneNumber);
  }

  @override
  void dispose() {
    _PhoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 40),
      child: Column(
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
                    setState(() {
                      _selectedDialCode = country.dialCode!;
                    });
                    _validtePhoneNumber();
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
                  controller: _PhoneNumber,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                    labelText: "** **** ***",
                    
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: _isValid ? () {

            } : null,
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }
}
