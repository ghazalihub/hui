class RTTIProperty {
  String name;
  String propertyType;
  RTTIProperty(this.name, this.propertyType);
}

class RTTIEntry {
  String className;
  String? superClass;
  Map<String, RTTIProperty> properties = {};
  RTTIEntry(this.className, [this.superClass]);
}

class RTTI {
  static Map<String, RTTIEntry> classInfo = {};

  static void load() {
    // In Dart, RTTI would be populated from metadata or code generation
  }

  static RTTIEntry? getClassInfo(String className) {
    return classInfo[className.toLowerCase()];
  }

  static RTTIProperty? getClassProperty(String className, String propertyName) {
    var info = getClassInfo(className);
    if (info == null) return null;
    var prop = info.properties[propertyName.toLowerCase()];
    if (prop == null && info.superClass != null) {
      return getClassProperty(info.superClass!, propertyName);
    }
    return prop;
  }
}
