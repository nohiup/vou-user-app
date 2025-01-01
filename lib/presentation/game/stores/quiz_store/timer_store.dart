import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:vou_user/domain/entity/question_model.dart';

part 'timer_store.g.dart';

class TimerStore = _TimerStore with _$TimerStore;

abstract class _TimerStore with Store {
  // Giữ thời gian còn lại
  @observable
  int remainingTime = 10;

  // Giữ trạng thái timer đang chạy
  @observable
  bool isTimerRunning = false;


  // Khai báo timer
  late Timer _timer;

  // Hàm bắt đầu đồng hồ đếm ngược
  @action
  void startTimer() {
    remainingTime = 10;
    isTimerRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        remainingTime--;
      } else {
        resetTimer(); // Dừng timer khi hết thời gian
      }
    });
  }

  // Hàm dừng timer
  @action
  void stopTimer() {
    _timer.cancel();
    isTimerRunning = false;
  }

  // Hàm reset lại timer
  @action
  void resetTimer() {
    stopTimer();
    startTimer();
  }
}