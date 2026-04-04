class CallbackMap<T> {
  final Map<String, List<T>> _map = {};
  void add(String id, T callback) {
    _map[id] ??= [];
    _map[id]!.add(callback);
  }

  void remove(String id, T callback) {
    _map[id]?.remove(callback);
  }

  void invoke(String id, [dynamic args]) {
    final callbacks = _map[id];
    if (callbacks != null) {
      for (var c in List.from(callbacks)) {
        // In Dart, we'd cast and call
      }
    }
  }
}
