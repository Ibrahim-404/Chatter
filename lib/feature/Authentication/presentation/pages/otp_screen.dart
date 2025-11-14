import 'package:chatter/core/constants/assets.dart';
import 'package:chatter/core/widget/custom_notification_widget.dart';
import 'package:chatter/feature/Authentication/presentation/manager/auht_bloc/bloc/send_varify_bloc.dart';
import 'package:chatter/feature/Authentication/presentation/pages/widget/OtpInputField.dart';
import 'package:chatter/feature/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpScreen extends StatefulWidget {
  String phoneNumber;
  OtpScreen({super.key, required this.phoneNumber});

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
          Center(
            child: BlocProvider(
              create: (context) => SendVarifyBloc(authRepo: sl()),
              child: OtpTextField(),
            ),
          ),
          const SizedBox(height: 24),
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
  String phoneNumber = "+1 234 567 8901";
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
