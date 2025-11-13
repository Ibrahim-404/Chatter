import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpTextField extends StatefulWidget {
  const OtpTextField({super.key});
  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  final pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 22,
        color: theme.textTheme.bodyLarge?.color ?? Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border(
          bottom: BorderSide(
            color: theme.textTheme.bodyLarge?.color ?? Colors.black,
            width: 2,
          ),
        ),
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            length: 6,
            controller: pinController,
            validator: (value) {
              if (value == null || value.length != 6) {
                return 'Enter 6 digits';
              }
              return null;
            },
            defaultPinTheme: PinTheme(
              width: 56,
              height: 56,
              textStyle: TextStyle(
                fontSize: 22,
                color: theme.textTheme.bodyLarge?.color ?? Colors.black,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: theme.textTheme.bodyLarge?.color ?? Colors.black,
                    width: 2,
                  ),
                ),
              ),
            ),

            focusedPinTheme: PinTheme(
              width: 56,
              height: 56,
              textStyle: TextStyle(
                fontSize: 22,
                color: theme.textTheme.bodyLarge?.color ?? Colors.black,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: theme.colorScheme.primary,
                    width: 3,
                  ),
                ),
              ),
            ),

            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: theme.colorScheme.primary),
              ),
            ),
            errorPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                border: Border.all(color: theme.colorScheme.error),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }
}
