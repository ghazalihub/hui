class Module {
  static const String DEFAULT_HAXEUI_PREFIX = "core";
  static const String DEFAULT_HAXEUI_NAMESPACE = "urn::haxeui::org";
  String? id, preloader, rootPath, classPath, preloadList;
  int priority = 0;
  List<ModuleResourceEntry> resourceEntries = [];
  List<ModuleComponentEntry> componentEntries = [];
  List<ModuleLayoutEntry> layoutEntries = [];
  Map<String, ModuleThemeEntry> themeEntries = {};
  List<ModulePropertyEntry> properties = [];
  List<ModulePreloadEntry> preload = [];
  List<ModuleLocaleEntry> locales = [];
  List<ModuleValidatorEntry> validators = [];
  List<ModuleActionInputSourceEntry> actionInputSources = [];
  Map<String, String> namespaces = {};
  List<ModuleImageLoaderEntry> imageLoaders = [];
  List<ModuleCssFunctionEntry> cssFunctions = [];
  List<ModuleCssFilterEntry> cssFilters = [];
  List<ModuleCssDirectiveEntry> cssDirectives = [];

  Module();
  void validate() {
    if (namespaces.isEmpty) namespaces[DEFAULT_HAXEUI_PREFIX] = DEFAULT_HAXEUI_NAMESPACE;
  }
}

class ModuleResourceEntry {
  String? path, prefix;
  List<String> exclusions = [], inclusions = [];
}

class ModuleClassEntry {
  String? classPackage, className, classFolder, classFile;
  bool loadAll = false;
}

class ModuleComponentEntry extends ModuleClassEntry {}
class ModuleLayoutEntry extends ModuleClassEntry {}

class ModuleThemeEntry {
  String? name, parent;
  List<ModuleThemeStyleEntry> styles = [];
  List<ModuleThemeImageEntry> images = [];
  Map<String, String> vars = {};
}

class ModuleThemeStyleEntry {
  String? resource, styleData;
  double priority = 0;
}

class ModuleThemeImageEntry {
  String? id, resource;
  double priority = 0;
}

class ModulePropertyEntry {
  String? name, value;
}

class ModulePreloadEntry {
  String? type, id;
}

class ModuleLocaleEntry {
  String? id;
  List<String> resources = [];
}

class ModuleValidatorEntry {
  String? id, className;
  Map<String, dynamic> properties = {};
}

class ModuleActionInputSourceEntry {
  String? className;
}

class ModuleImageLoaderEntry {
  String? prefix, pattern, className;
  bool isDefault = false, singleInstance = false;
}

class ModuleCssFunctionEntry {
  String? name, call;
}

class ModuleCssFilterEntry {
  String? name, className;
}

class ModuleCssDirectiveEntry {
  String? name, className;
}
