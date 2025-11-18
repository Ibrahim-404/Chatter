import 'dart:async';

import 'package:chatter/feature/Authentication/presentation/manager/signout_bloc/timer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTimer extends StatelessWidget {
  const CustomTimer({super.key});

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, int>(
      builder: (context, state) {
        return Text(
          formatTime(state),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        );
      },
    );
  }
}
