import 'dart:async';

class TimerImpl {
  Timer? _timer;
  bool _stopped = false;

  TimerImpl(int delay, void Function() callback) {
    _timer = Timer.periodic(Duration(milliseconds: delay), (timer) {
      if (!_stopped) {
        callback();
      } else {
        timer.cancel();
      }
    });
  }

  void stop() {
    _stopped = true;
    _timer?.cancel();
    _timer = null;
  }
}
