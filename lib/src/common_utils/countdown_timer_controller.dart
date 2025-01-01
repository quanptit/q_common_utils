import 'dart:async';

class CountDownTimerController {
  /// callback when end reach
  final void Function() onEnd;
  final void Function(int timeSecondRemain) onChangeTimeRemain;
  final int reduceSecondsBy;

  /// tổng thời gian của count down
  int totalSeconds = 0;

  /// Thời gian còn lại của count down
  int timeSecondRemain = 0;

  Timer? countdownTimer;

  CountDownTimerController({required this.onEnd, required this.onChangeTimeRemain, this.reduceSecondsBy = 1});

  _createTimerAndStart() {
    countdownTimer?.cancel(); // nếu đang có timer ==> hủy
    countdownTimer = Timer.periodic(Duration(seconds: reduceSecondsBy), (_) => _setCountDown());
  }

  void startCountDown({required int totalSeconds}) {
    this.totalSeconds = totalSeconds;
    timeSecondRemain = totalSeconds;
    onChangeTimeRemain(timeSecondRemain);
    _createTimerAndStart();
  }

  void resumeCountDown() {
    if (timeSecondRemain <= 0) {
      onEnd();
      return;
    }
    onChangeTimeRemain(timeSecondRemain);
    _createTimerAndStart();
  }

  void pauseCountDown() {
    countdownTimer?.cancel();
  }

  void _setCountDown() {
    timeSecondRemain -= reduceSecondsBy;
    if (timeSecondRemain <= 0) {
      onChangeTimeRemain(0);
      _stopCountDown();
      onEnd();
    } else {
      onChangeTimeRemain(timeSecondRemain);
    }
  }

  void dispose() {
    _stopCountDown();
    totalSeconds = 0;
  }

  void _stopCountDown() {
    countdownTimer?.cancel();
    timeSecondRemain = 0;
  }
}
