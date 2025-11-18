import 'package:chatter/core/constants/assets.dart';
import 'package:chatter/core/routes/routes_names.dart';
import 'package:chatter/core/widget/custom_notification_widget.dart';
import 'package:chatter/feature/Authentication/presentation/manager/auht_bloc/bloc/send_varify_bloc.dart';
import 'package:chatter/feature/Authentication/presentation/manager/auht_bloc/validation/bloc/validation_bloc.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowMyBottomSheet extends StatefulWidget {
  const ShowMyBottomSheet({super.key});

  @override
  State<ShowMyBottomSheet> createState() => _ShowMyBottomSheetState();
}

class _ShowMyBottomSheetState extends State<ShowMyBottomSheet> {
  final TextEditingController _phoneNumber = TextEditingController();
  final ValueNotifier<String> selectedCountryCode = ValueNotifier("+20");

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendVarifyBloc, SendVarifyState>(
      listener: (context, sendOtpState) {
        if (sendOtpState is SendSuccess) {
          showCustomNotification(
            context: context,
            title: "Chatter",
            message: "Check your SMS for the verification code 👀",
            imagePath: Assets.assetsIconsChat,
          );
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.pushReplacementNamed(
              context,
              RoutesNames.signIn,
              arguments:{
                'phone': _phoneNumber.text.trim(),
                'dialCode': selectedCountryCode.value,
              }
                  
            );
          });
        }

        if (sendOtpState is SendFailure) {
          showCustomNotification(
            context: context,
            title: "Chatter",
            message: "${sendOtpState.errorMessage} ",
            imagePath: Assets.assetsIconsChat,
          );
        }
      },
      child: Padding(
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
              const Text("Phone number"),
              const SizedBox(height: 8),

              /// Country picker + phone number field
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ValueListenableBuilder(
                      valueListenable: selectedCountryCode,
                      builder: (context, value, child) {
                        return CountryCodePicker(
                          onChanged: (country) {
                            selectedCountryCode.value =
                                country.dialCode ?? "+20";
                          },
                          onInit: (country) {
                            selectedCountryCode.value =
                                country?.dialCode ?? "+20";
                          },
                          initialSelection: "EG",
                          favorite: const ["+20", "EG"],
                          showCountryOnly: false,
                          showFlag: true,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _phoneNumber,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(),
                        labelText: "** **** ***",
                      ),
                      onChanged: (value) {
                        BlocProvider.of<ValidationBloc>(context).add(
                          ValidatePhoneNumber(value, selectedCountryCode.value),
                        );
                        print(value);
                      },
                      onTapOutside:
                          (_) => FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: BlocBuilder<ValidationBloc, ValidationState>(
                  builder: (context, validationState) {
                    final isValid =
                        validationState is NumberPhoneValidation &&
                        validationState.isValid;

                    return InkWell(
                      onTap:
                          isValid
                              ? () async {
                                final phone = _phoneNumber.text.trim();
                                BlocProvider.of<SendVarifyBloc>(context).add(
                                  SendOtpEvent(
                                    phoneNumber: phone,
                                    dialCode: selectedCountryCode.value,
                                  ),
                                );
                              }
                              : null,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 50,
                        decoration: BoxDecoration(
                          color: isValid ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: BlocBuilder<SendVarifyBloc, SendVarifyState>(
                              builder: (context, sendOtpState) {
                                if (sendOtpState is SendLoading) {
                                  return const SizedBox(
                                    key: ValueKey('loading'),
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  );
                                }
                                return const Text(
                                  "Next",
                                  key: ValueKey('text'),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneNumber.dispose();
    super.dispose();
  }
}
