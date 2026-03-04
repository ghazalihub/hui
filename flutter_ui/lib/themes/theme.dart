import 'theme_entry.dart';
import 'theme_image_entry.dart';

class Theme {
  static const String DEFAULT = "default";
  static const String DARK = "dark";

  String? parent;
  List<ThemeEntry> styles = [];
  List<ThemeImageEntry> images = [];
  Map<String, String> vars = {};

  Theme();
}
