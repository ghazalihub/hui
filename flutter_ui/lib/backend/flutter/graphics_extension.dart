import 'dart:ui' as ui;
import 'dart:math' as math;

class GraphicsExtension {
  static void drawArc(ui.Canvas canvas, double cx, double cy, double radius,
      double sAngle, double eAngle,
      {double strength = 1.0, bool ccw = false, int segments = 0}) {
    sAngle = sAngle % (math.pi * 2);
    eAngle = eAngle % (math.pi * 2);
    if (ccw) {
      if (eAngle > sAngle) eAngle -= math.pi * 2;
    } else if (eAngle < sAngle) {
      eAngle += math.pi * 2;
    }
    radius += strength / 2;
    if (segments <= 0) segments = (10 * math.sqrt(radius)).floor();
    double theta = (eAngle - sAngle) / segments;
    double c = math.cos(theta), s = math.sin(theta);
    double x = math.cos(sAngle) * radius, y = math.sin(sAngle) * radius;
    for (int n = 0; n < segments; n++) {
      double px = x + cx, py = y + cy;
      double t = x;
      x = c * x - s * y;
      y = c * y + s * t;
      _drawInnerLine(canvas, x + cx, y + cy, px, py, strength);
    }
  }

  static void fillArc(ui.Canvas canvas, double cx, double cy, double radius,
      double sAngle, double eAngle,
      {bool ccw = false, int segments = 0}) {
    sAngle = sAngle % (math.pi * 2);
    eAngle = eAngle % (math.pi * 2);
    if (ccw) {
      if (eAngle > sAngle) eAngle -= math.pi * 2;
    } else if (eAngle < sAngle) {
      eAngle += math.pi * 2;
    }
    if (segments <= 0) segments = (10 * math.sqrt(radius)).floor();
    double theta = (eAngle - sAngle) / segments;
    double c = math.cos(theta), s = math.sin(theta);
    double x = math.cos(sAngle) * radius, y = math.sin(sAngle) * radius;
    final paint = ui.Paint()..style = ui.PaintingStyle.fill;
    for (int n = 0; n < segments; n++) {
      double px = x + cx, py = y + cy;
      double t = x;
      x = c * x - s * y;
      y = c * y + s * t;
      final path = ui.Path();
      path.moveTo(px, py);
      path.lineTo(x + cx, y + cy);
      path.lineTo(cx, cy);
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  static void drawCircle(ui.Canvas canvas, double cx, double cy, double radius,
      {double strength = 1.0, int segments = 0}) {
    radius += strength / 2;
    if (segments <= 0) segments = (10 * math.sqrt(radius)).floor();
    double theta = 2 * math.pi / segments;
    double c = math.cos(theta), s = math.sin(theta);
    double x = radius, y = 0.0;
    for (int n = 0; n < segments; n++) {
      double px = x + cx, py = y + cy;
      double t = x;
      x = c * x - s * y;
      y = c * y + s * t;
      _drawInnerLine(canvas, x + cx, y + cy, px, py, strength);
    }
  }

  static void _drawInnerLine(ui.Canvas canvas, double x1, double y1, double x2,
      double y2, double strength) {
    int side = y2 > y1 ? 1 : 0;
    if (y2 == y1) side = x2 - x1 > 0 ? 1 : 0;
    ui.Offset vec = (y2 == y1)
        ? const ui.Offset(0, -1)
        : ui.Offset(1, -(x2 - x1) / (y2 - y1));
    vec = vec * (strength / vec.distance);
    ui.Offset p1 = ui.Offset(x1 + side * vec.dx, y1 + side * vec.dy);
    ui.Offset p2 = ui.Offset(x2 + side * vec.dx, y2 + side * vec.dy);
    ui.Offset p3 = p1 - vec, p4 = p2 - vec;
    final paint = ui.Paint()..style = ui.PaintingStyle.fill;
    final path = ui.Path();
    path.moveTo(p1.dx, p1.dy);
    path.lineTo(p2.dx, p2.dy);
    path.lineTo(p4.dx, p4.dy);
    path.lineTo(p3.dx, p3.dy);
    path.close();
    canvas.drawPath(path, paint);
  }

  static void fillCircle(ui.Canvas canvas, double cx, double cy, double radius,
      {int segments = 0}) {
    if (segments <= 0) segments = (10 * math.sqrt(radius)).floor();
    double theta = 2 * math.pi / segments;
    double c = math.cos(theta), s = math.sin(theta);
    double x = radius, y = 0.0;
    final paint = ui.Paint()..style = ui.PaintingStyle.fill;
    for (int n = 0; n < segments; n++) {
      double px = x + cx, py = y + cy;
      double t = x;
      x = c * x - s * y;
      y = c * y + s * t;
      final path = ui.Path();
      path.moveTo(px, py);
      path.lineTo(x + cx, y + cy);
      path.lineTo(cx, cy);
      path.close();
      canvas.drawPath(path, paint);
    }
  }
}
