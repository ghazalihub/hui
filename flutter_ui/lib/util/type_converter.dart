class TypeConverter {
  static dynamic convertFrom(dynamic input) {
    if (input is String) {
      if (input == "true") return true;
      if (input == "false") return false;
      return double.tryParse(input) ?? input;
    }
    return input;
  }
}
