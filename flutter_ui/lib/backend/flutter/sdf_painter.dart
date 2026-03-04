import 'dart:ui' as ui;

class SDFPainter {
  final ui.Canvas canvas;
  ui.Color color = const ui.Color(0xFF000000);
  double opacity = 1.0;

  SDFPainter(this.canvas);

  void sdfRect(double x, double y, double width, double height,
      {double radius = 0,
      double borderSize = 0,
      ui.Color? borderColor,
      double smoothness = 0,
      ui.Color? color}) {
    final paint = ui.Paint()
      ..color = (color ?? this.color).withOpacity(opacity)
      ..style = ui.PaintingStyle.fill;
    if (smoothness > 0) {
      paint.maskFilter = ui.MaskFilter.blur(ui.BlurStyle.normal, smoothness);
    }
    final rect = ui.Rect.fromLTWH(x, y, width, height);
    if (radius > 0) {
      canvas.drawRRect(
          ui.RRect.fromRectAndRadius(rect, ui.Radius.circular(radius)), paint);
    } else {
      canvas.drawRect(rect, paint);
    }

    if (borderSize > 0 && borderColor != null) {
      final borderPaint = ui.Paint()
        ..color = borderColor.withOpacity(opacity)
        ..style = ui.PaintingStyle.stroke
        ..strokeWidth = borderSize;
      if (smoothness > 0) {
        borderPaint.maskFilter =
            ui.MaskFilter.blur(ui.BlurStyle.normal, smoothness);
      }
      if (radius > 0) {
        canvas.drawRRect(
            ui.RRect.fromRectAndRadius(rect, ui.Radius.circular(radius)),
            borderPaint);
      } else {
        canvas.drawRect(rect, borderPaint);
      }
    }
  }

  void sdfCircle(double x, double y, double r,
      {double borderSize = 0, ui.Color? borderColor, double smoothness = 0}) {
    final paint = ui.Paint()
      ..color = color.withOpacity(opacity)
      ..style = ui.PaintingStyle.fill;
    if (smoothness > 0) {
      paint.maskFilter = ui.MaskFilter.blur(ui.BlurStyle.normal, smoothness);
    }
    canvas.drawCircle(ui.Offset(x, y), r, paint);

    if (borderSize > 0 && borderColor != null) {
      final borderPaint = ui.Paint()
        ..color = borderColor.withOpacity(opacity)
        ..style = ui.PaintingStyle.stroke
        ..strokeWidth = borderSize;
      if (smoothness > 0) {
        borderPaint.maskFilter =
            ui.MaskFilter.blur(ui.BlurStyle.normal, smoothness);
      }
      canvas.drawCircle(ui.Offset(x, y), r, borderPaint);
    }
  }

  void sdfLine(double x1, double y1, double x2, double y2, double strength,
      double smoothness) {
    final paint = ui.Paint()
      ..color = color.withOpacity(opacity)
      ..style = ui.PaintingStyle.stroke
      ..strokeWidth = strength;
    if (smoothness > 0) {
      paint.maskFilter = ui.MaskFilter.blur(ui.BlurStyle.normal, smoothness);
    }
    canvas.drawLine(ui.Offset(x1, y1), ui.Offset(x2, y2), paint);
  }
}
