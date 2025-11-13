import 'package:chatter/core/constants/assets.dart';
import 'package:chatter/core/widget/custom_notification_widget.dart';
import 'package:chatter/feature/Authentication/presentation/pages/widget/OtpInputField.dart';
import 'package:flutter/material.dart';

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
          Expanded(
            flex: 2,
            child: Center(child: Image.asset(Assets.assetsImagesOtp, fit: BoxFit.contain,))),
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
        ],
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
