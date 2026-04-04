class Properties {
  final Map<String, String> _map = {};
  void set(String name, String value) => _map[name] = value;
  String? get(String name) => _map[name];
}
