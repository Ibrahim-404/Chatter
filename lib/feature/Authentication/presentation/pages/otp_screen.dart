// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatter/feature/Authentication/presentation/manager/signout_bloc/timer_cubit.dart';
import 'package:chatter/feature/Authentication/presentation/pages/widget/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatter/core/constants/assets.dart';
import 'package:chatter/core/widget/custom_notification_widget.dart';
import 'package:chatter/feature/Authentication/presentation/manager/auht_bloc/bloc/send_varify_bloc.dart';
import 'package:chatter/feature/Authentication/presentation/pages/widget/OtpInputField.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  final String dialCode;

  OtpScreen({super.key, required this.phoneNumber, required this.dialCode});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OtpImage(),
          const SizedBox(height: 20),
          Text(
            "OTP Verification",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 10),
          CustomRichTextEnterOtp(phoneNumber: widget.phoneNumber),
          const SizedBox(height: 24),
          Center(child: OtpTextField()),
          const SizedBox(height: 24),
          ResendOtpWithTimer(
            phoneNumber: widget.phoneNumber,
            dialCode: widget.dialCode,
          ),
        ],
      ),
    );
  }
}

class OtpImage extends StatelessWidget {
  const OtpImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Image.asset(
        Assets.assetsImagesOtp,
        fit: BoxFit.contain,
        width: 200,
        height: 200,
      ),
    );
  }
}

class CustomRichTextEnterOtp extends StatelessWidget {
  final String phoneNumber;
  CustomRichTextEnterOtp({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "We have sent an OTP to ",
        style: Theme.of(context).textTheme.bodyMedium,
        children: [
          TextSpan(
            text: phoneNumber,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ResendOtp extends StatelessWidget {
  const ResendOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Didn't receive the OTP? ",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextButton(
          onPressed: () {
            showCustomNotification(
              context: context,
              title: "Chatter",
              message: "OTP resent successfully!",
              imagePath: Assets.assetsIconsChat,
            );
          },
          child: Text(
            "Resend OTP",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class ResendOtpWithTimer extends StatelessWidget {
  final String phoneNumber;
  final String dialCode;

  const ResendOtpWithTimer({
    Key? key,
    required this.phoneNumber,
    required this.dialCode,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendVarifyBloc, SendVarifyState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Didn't receive the OTP? ",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child:
                  state is SendSuccess
                      ? TextButton(
                        onPressed: () {
                          context.read<SendVarifyBloc>().add(
                            SendOtpEvent(
                              phoneNumber: phoneNumber,
                              dialCode: dialCode,
                            ),
                          );
                          context.read<TimerCubit>().startTimer();
                        },
                        child: Text(
                          "Resend OTP",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                      : CustomTimer(),
            ),
          ],
        );
      },
    );
  }
}
