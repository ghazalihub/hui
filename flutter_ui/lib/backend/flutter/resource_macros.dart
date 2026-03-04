class ResourceMacros {
  // Utility to build a list of files, mirroring Haxe UI's buildFileList macro functionality.
  // In Dart, this can be used as a runtime helper or part of a build_runner script.
  static List<Map<String, dynamic>> buildFileList(
      String path, List<String> discoveredFiles) {
    List<Map<String, dynamic>> files = [];

    for (var item in discoveredFiles) {
      String relativePath = item.replaceFirst(path, "");
      if (relativePath.startsWith("/")) {
        relativePath = relativePath.substring(1);
      }

      List<String> arr = relativePath.split(".");
      if (arr.length > 1) arr.removeLast();
      String resourceName = arr
          .join("_")
          .replaceAll("/", "_")
          .replaceAll(" ", "_")
          .replaceAll("-", "_");

      if (relativePath.endsWith(".png") || relativePath.endsWith(".jpg")) {
        files.add({
          "name": resourceName,
          "type": "image",
          "files": [relativePath]
        });
      } else if (relativePath.endsWith(".ttf")) {
        files.add({
          "name": resourceName,
          "type": "font",
          "files": [relativePath]
        });
      }
    }

    return files;
  }
}
