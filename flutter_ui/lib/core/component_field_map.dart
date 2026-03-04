class ComponentFieldMap {
  static ComponentFieldMap? _instance;
  static ComponentFieldMap get instance {
    _instance ??= ComponentFieldMap();
    return _instance!;
  }

  static String? get(String className, String fieldName) {
    return instance.getMappedField(className, fieldName);
  }

  static void register(
      String className, String fieldName, String mappedFieldName) {
    instance.mapField(className, fieldName, mappedFieldName);
  }

  final Map<String, Map<String, String>> _map = {};

  ComponentFieldMap();

  String? getMappedField(String className, String fieldName) {
    return _map[className]?[fieldName];
  }

  void mapField(String className, String fieldName, String mappedFieldName) {
    _map[className] ??= {};
    _map[className]![fieldName] = mappedFieldName;
  }
}
