class LocaleParser {
  static final Map<String, Type> _parsers = {};

  static LocaleParser? get(String extension) {
    Type? cls = _parsers[extension];
    if (cls == null) return null;
    // In a real framework, we'd use a registry or factory for instantiation
    return null;
  }

  static void register(String extension, Type cls) {
    _parsers[extension] = cls;
  }

  Map<String, String> parse(String data) {
    return {};
  }
}
