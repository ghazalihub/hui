class ComponentClassMap {
  static ComponentClassMap? _instance;
  static ComponentClassMap get instance {
    _instance ??= ComponentClassMap();
    return _instance!;
  }

  static String? get(String alias) {
    alias = alias.replaceAll("-", "").toLowerCase();
    return instance.getClassName(alias);
  }

  static void register(String alias, String className) {
    instance.registerClassName(alias.toLowerCase(), className);
  }

  static Iterable<String> list() {
    return instance._map.keys;
  }

  static void clear() {
    instance._map = {};
  }

  static bool hasClass(String className) {
    return instance.hasClassName(className);
  }

  Map<String, String> _map = {};

  ComponentClassMap();

  String? getClassName(String alias) {
    return _map[alias.toLowerCase()];
  }

  void registerClassName(String alias, String className) {
    _map[alias.toLowerCase()] = className;
  }

  bool hasClassName(String className) {
    return _map.values.contains(className);
  }
}
