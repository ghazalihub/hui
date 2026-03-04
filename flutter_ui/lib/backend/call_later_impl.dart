import 'dart:async';

class CallLaterImpl {
  CallLaterImpl(void Function() fn) {
    Timer(const Duration(milliseconds: 1), fn);
  }
}
