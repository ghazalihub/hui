class StyleUtil {
  static String styleProperty2ComponentProperty(String property) {
    return property.replaceAllMapped(RegExp(r'-(\w)'), (m) => m[1]!.toUpperCase());
  }

  static String componentProperty2StyleProperty(String property) {
    return property.replaceAllMapped(RegExp(r'([A-Z])'), (m) => '-${m[1]!.toLowerCase()}');
  }
}
