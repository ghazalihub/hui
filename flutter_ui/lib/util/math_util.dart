import 'dart:math' as math;

class MathUtil {
  static const int MIN_INT = -2147483648;
  static const int MAX_INT = 2147483647;
  static double round(double v, [int precision = 0]) {
    double factor = math.pow(10, precision).toDouble();
    return (v * factor).round() / factor;
  }
}
