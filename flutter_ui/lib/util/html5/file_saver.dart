import 'dart:typed_data';

class FileSaver {
  FileSaver();
  void saveText(String fileName, String text, void Function(bool) callback) {
    // Cross-platform stub, logic to be added with platform specific plugins if needed
    callback(false);
  }

  void saveBinary(
      String fileName, Uint8List bytes, void Function(bool) callback) {
    // Cross-platform stub
    callback(false);
  }
}
