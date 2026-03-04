class ValidatorManager {
  static ValidatorManager? _instance;
  static ValidatorManager get instance {
    _instance ??= ValidatorManager();
    return _instance!;
  }

  final Map<String, Map<String, dynamic>> _registeredValidators = {};

  ValidatorManager();

  void registerValidator(String id, dynamic Function() ctor,
      [Map<String, dynamic>? defaultProperties]) {
    _registeredValidators[id] = {
      "ctor": ctor,
      "defaultProperties": defaultProperties
    };
  }

  dynamic createValidator(String id, [dynamic config]) {
    final item = _registeredValidators[id];
    if (item == null) return null;
    final ctor = item["ctor"] as dynamic Function();
    return ctor();
  }
}
