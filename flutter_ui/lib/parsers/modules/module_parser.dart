import 'module.dart';

class ModuleParser {
  static final Map<String, Type> _parsers = {};
  static ModuleParser? get(String extension) => null;
  static void register(String extension, Type cls) => _parsers[extension] = cls;
  Module parse(String data, Map<String, String> defines, [String? context]) =>
      Module();
}
