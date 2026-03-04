class ClassFactory<T> {
  final Type generator;
  final Map<String, dynamic>? properties;

  ClassFactory(this.generator, [this.properties]);

  T newInstance(T Function() creator) {
    T instance = creator();
    return instance;
  }
}
