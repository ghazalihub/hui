import 'dart:math' as math;

class Point {
  double x;
  double y;

  Point([this.x = 0, this.y = 0]);

  void set([double x = 0, double y = 0]) {
    this.x = x;
    this.y = y;
  }

  double length() => math.sqrt(x * x + y * y);

  void multiply(double factor) {
    x *= factor;
    y *= factor;
  }

  Point product(double factor) => Point(x * factor, y * factor);

  void normalize(double targetLength) {
    if (x == 0 && y == 0) return;
    double norm = targetLength / length();
    multiply(norm);
  }

  Point normalized(double targetLength) {
    if (x == 0 && y == 0) return Point();
    double norm = targetLength / length();
    return product(norm);
  }

  Point orth() => normalized(1);

  Point copy() => Point(x, y);
}
