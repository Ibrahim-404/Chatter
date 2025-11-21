import 'package:chatter/feature/Authentication/presentation/manager/auht_bloc/bloc/send_varify_bloc.dart';
import 'package:chatter/feature/Authentication/presentation/manager/signout_bloc/timer_cubit.dart';
import 'package:chatter/feature/Authentication/presentation/pages/otp_screen.dart';
import 'package:chatter/feature/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpScreenWrapper extends StatelessWidget {
  final String phone;
  final String dialCode;

  const OtpScreenWrapper({
    super.key,
    required this.phone,
    required this.dialCode,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TimerCubit(30)..startTimer()),
        BlocProvider(create: (_) => SendVarifyBloc(authRepo: sl())),
      ],
      child: OtpScreen(phoneNumber: phone, dialCode: dialCode),
    );
  }
}
