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
        border: Border.all(color: theme.dividerColor),
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            length: 4,
            controller: pinController,
            validator: (value) {
              if (value == null || value.length != 4) {
                return 'Enter 4 digits';
              }
              return null;
            },
            defaultPinTheme: defaultPinTheme,
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            onCompleted: (pin) => debugPrint('Completed: $pin'),
            onChanged: (value) => debugPrint('Changed: $value'),
            cursor: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 9),
                  width: 24,
                  height: 2,
                  color: theme.textTheme.bodyLarge?.color ?? Colors.black,
                ),
              ],
            ),
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: theme.colorScheme.primary),
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
