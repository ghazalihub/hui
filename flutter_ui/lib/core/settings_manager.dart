import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

class SettingsManager {
  static SettingsManager? _instance;
  static SettingsManager get instance {
    _instance ??= SettingsManager();
    return _instance!;
  }

  ISettingsPersister? _persister;

  SettingsManager();

  void set<T>(String name, T? value) {
    String s = jsonEncode(value);
    getPersister().set(name, s);
  }

  T? get<T>(String name, [T? defaultValue]) {
    String? s = getPersister().get(name);
    if (s == null) {
      return defaultValue;
    }
    return jsonDecode(s) as T?;
  }

  ISettingsPersister getPersister() {
    if (_persister != null) {
      return _persister!;
    }
    if (kIsWeb) {
      _persister = NoOpSettingsPersister();
    } else {
      _persister = FileSettingsPersister();
    }
    return _persister!;
  }
}

abstract class ISettingsPersister {
  void set(String name, String value);
  String? get(String name);
}

class FileSettingsPersister implements ISettingsPersister {
  String filename = "settings.json";
  FileSettingsPersister();
  @override
  void set(String name, String value) {
    Map<String, dynamic> o = load();
    o[name] = value;
    save(o);
  }

  @override
  String? get(String name) {
    Map<String, dynamic> o = load();
    return o[name] as String?;
  }

  Map<String, dynamic> load() {
    File file = File(filename);
    if (file.existsSync()) {
      String content = file.readAsStringSync();
      if (content.isNotEmpty) {
        return jsonDecode(content) as Map<String, dynamic>;
      }
    }
    return {};
  }

  void save(Map<String, dynamic> o) {
    File(filename).writeAsStringSync(jsonEncode(o));
  }
}

class NoOpSettingsPersister implements ISettingsPersister {
  NoOpSettingsPersister();
  @override
  void set(String name, String value) {}
  @override
  String? get(String name) => null;
}
