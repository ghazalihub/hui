class FunctionArray<T> {
  final List<T> _array = [];
  void add(T f) => _array.add(f);
  void remove(T f) => _array.remove(f);
  int get length => _array.length;
  T operator [](int index) => _array[index];
}
