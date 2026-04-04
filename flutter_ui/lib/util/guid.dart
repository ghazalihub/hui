import 'dart:math' as math;

class GUID {
  static String uuid() {
    final rnd = math.Random();
    return List.generate(32, (i) => rnd.nextInt(16).toRadixString(16)).join();
  }
}
