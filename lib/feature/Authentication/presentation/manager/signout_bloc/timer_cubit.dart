import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

class TimerCubit extends Cubit<int> {
  TimerCubit(this.initialTime) : super(initialTime);
  final int initialTime;
  Timer? _timer;
  void startTimer() {
    _timer?.cancel();
    emit(initialTime);
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (state == 0) {
        timer.cancel();
      } else {
        emit(state - 1);
      }
    });
  }
}
