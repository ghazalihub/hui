class LayoutFactory {
  static final Map<String, String> _map = {};
  static dynamic createFromName(String name) {
    String? className = _map[name.toLowerCase()];
    if (className == null) return null;
    // In Dart, instantiation by name requires a registry
    return null;
  }

  static void register(String name, String className) {
    _map[name.toLowerCase()] = className;
  }

  static String? lookupClass(String name) => _map[name.toLowerCase()];
}
