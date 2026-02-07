import 'package:chatter/core/routes/routes_names.dart';
import 'package:chatter/feature/Authentication/presentation/manager/auht_bloc/bloc/send_varify_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:pinput/pinput.dart';

class OtpTextField extends StatefulWidget {
  final String phoneNumber;
  const OtpTextField({super.key, required this.phoneNumber});
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

    return BlocConsumer<SendVarifyBloc, SendVarifyState>(
      listener: (context, state) {
        if (state is VerifyCodeFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: theme.colorScheme.error,
            ),
          );
          Logger().e(" OTP Verification failed: ${state.errorMessage}");
        }
        if (state is VerifyCodeSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('OTP Verified Successfully!'),
              backgroundColor: theme.colorScheme.primary,
            ),
          );
          Logger().i("OTP Verified Successfully!");
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesNames.profile,
            (route) => false,
            arguments: widget.phoneNumber,
          );
        }
        if (state is VerifyCodeLoading) {
          CircularProgressIndicator(color: theme.colorScheme.primary);
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Directionality(
              textDirection: TextDirection.ltr,
              child: Pinput(
                closeKeyboardWhenCompleted: true,
                keyboardType: TextInputType.number,
                errorBuilder: (errorText, pin) {
                  return Text(
                    'Invalid OTP',
                    style: TextStyle(
                      color: theme.colorScheme.error,
                      fontSize: 12,
                    ),
                  );
                },
                length: 6,
                controller: pinController,
                onCompleted: (pin) {
                  context.read<SendVarifyBloc>().add(VerifyOtpEvent(otp: pin));
                },
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
      },
    );
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }
}
