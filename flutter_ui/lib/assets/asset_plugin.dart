class AssetPlugin {
  Map<String, String>? _props;
  AssetPlugin();
  dynamic invoke(dynamic asset) => asset;
  void setProperty(String name, String value) {
    _props ??= {};
    _props![name] = value;
  }

  String? getProperty(String name, [String? defaultValue]) {
    if (_props == null) return defaultValue;
    return _props![name] ?? defaultValue;
  }
}
