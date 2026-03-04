import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;

class PlatformBase {
  static const int KEY_CODE_TAB = 9;
  static const int KEY_CODE_UP = 38;
  static const int KEY_CODE_DOWN = 40;
  static const int KEY_CODE_LEFT = 37;
  static const int KEY_CODE_RIGHT = 39;
  static const int KEY_CODE_SPACE = 32;
  static const int KEY_CODE_ENTER = 13;
  static const int KEY_CODE_ESCAPE = 27;

  PlatformBase();

  bool get isWindows =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.windows;
  bool get isLinux => !kIsWeb && defaultTargetPlatform == TargetPlatform.linux;
  bool get isMac => !kIsWeb && defaultTargetPlatform == TargetPlatform.macOS;
  bool get isMobile =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  double getMetric(String id) => 0;
  int? getColor(String id) => null;
  String? getSystemLocale() => kIsWeb ? null : Platform.localeName;
  double perf() => DateTime.now().millisecondsSinceEpoch.toDouble();

  int get KeyTab => getKeyCode("tab");
  int get KeyUp => getKeyCode("up");
  int get KeyDown => getKeyCode("down");
  int get KeyLeft => getKeyCode("left");
  int get KeyRight => getKeyCode("right");
  int get KeySpace => getKeyCode("space");
  int get KeyEnter => getKeyCode("enter");
  int get KeyEscape => getKeyCode("escape");

  int getKeyCode(String keyId) {
    switch (keyId) {
      case "tab":
        return KEY_CODE_TAB;
      case "up":
        return KEY_CODE_UP;
      case "down":
        return KEY_CODE_DOWN;
      case "left":
        return KEY_CODE_LEFT;
      case "right":
        return KEY_CODE_RIGHT;
      case "space":
        return KEY_CODE_SPACE;
      case "enter":
        return KEY_CODE_ENTER;
      case "escape":
        return KEY_CODE_ESCAPE;
      default:
        return keyId.isNotEmpty ? keyId.codeUnitAt(0) : -1;
    }
  }
}
