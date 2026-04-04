class DataSource<T> {
  void add(dynamic o) {}
}

class DataSourceFactory<T> {
  DataSourceFactory();
  DataSource<T> create(Type type) {
    return DataSource<T>();
  }

  DataSource<T> fromString(String data, Type type) {
    var ds = create(type);
    if (data.startsWith("<")) {
      // XML parsing logic to be refined when XML library is added
    } else if (data.startsWith("[")) {
      // JSON parsing logic
    }
    return ds;
  }

  List<T> fromStringToArray(String data) {
    return [];
  }
}
