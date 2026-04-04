import 'dart:ui' as ui;

class BitmapDataCache {
  static final Map<String, ui.Image> _cache = {};
  static void set(String id, ui.Image image) => _cache[id] = image;
  static ui.Image? get(String id) => _cache[id];
}
