class ResourceResolver {
  Map<String, dynamic>? _params;
  ResourceResolver([this._params]);
  String? getResourceData(String r) => null;
  String? extension(String path) {
    if (!path.contains(".")) return null;
    return path.split(".").last;
  }
}
