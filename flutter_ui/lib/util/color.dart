class Color {
  final int value;
  Color(this.value);

  int get r => (value >> 16) & 0xFF;
  int get g => (value >> 8) & 0xFF;
  int get b => value & 0xFF;
  int get a => (value >> 24) & 0xFF;

  static Color fromComponents(int r, int g, int b, int a) {
    return Color((a << 24) | (r << 16) | (g << 8) | b);
  }

  static Color fromString(String s) {
    if (s.startsWith("#")) s = s.substring(1);
    if (s.startsWith("0x")) s = s.substring(2);
    return Color(int.parse(s, radix: 16));
  }
}
