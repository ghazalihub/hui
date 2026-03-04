import 'dart:math' as math;
import 'color.dart';

class HSL {
  double h, s, l;
  HSL(this.h, this.s, this.l);
}

class HSV {
  double h, s, v;
  HSV(this.h, this.s, this.v);
}

class RGBF {
  double r, g, b;
  RGBF(this.r, this.g, this.b);
}

class ColorUtil {
  static HSL toHSL(Color color) {
    double r = color.r / 255, g = color.g / 255, b = color.b / 255;
    double min = [r, g, b].reduce(math.min);
    double max = [r, g, b].reduce(math.max);
    double delta = max - min, h = 0, s = 0, l = (max + min) / 2;
    if (delta != 0) {
      s = l < 0.5 ? delta / (max + min) : delta / (2 - max - min);
      if (r == max) {
        h = (g - b) / delta + (g < b ? 6 : 0);
      } else if (g == max) {
        h = (b - r) / delta + 2;
      } else {
        h = (r - g) / delta + 4;
      }
      h *= 60;
    }
    return HSL(h.roundToDouble(), s * 100, l * 100);
  }

  static Color fromHSL(double hue, double saturation, double luminosity) {
    saturation /= 100;
    luminosity /= 100;
    double c(double d, double s, double l) {
      double m2 = l <= 0.5 ? l * (1 + s) : l + s - l * s;
      double m1 = 2 * l - m2;
      d = d % 360;
      if (d < 0) d += 360;
      if (d < 60) return m1 + (m2 - m1) * d / 60;
      if (d < 180) return m2;
      if (d < 240) return m1 + (m2 - m1) * (240 - d) / 60;
      return m1;
    }

    return Color.fromComponents((c(hue + 120, saturation, luminosity) * 255).round(), (c(hue, saturation, luminosity) * 255).round(), (c(hue - 120, saturation, luminosity) * 255).round(), 255);
  }
}
