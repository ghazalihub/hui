class ToolkitOptions {
  bool? noBatch;
  bool? showFPS;
  bool? flattenAssetPaths;
  MouseInputOptions? mouseInput;
  KeyboardInputOptions? keyboardInput;

  ToolkitOptions({
    this.noBatch,
    this.showFPS,
    this.flattenAssetPaths,
    this.mouseInput,
    this.keyboardInput,
  });
}

typedef MouseListenerCallback = void Function(
    void Function(int, int, int) down,
    void Function(int, int, int) up,
    void Function(int, int, int, int) move,
    void Function(int) wheel,
    void Function() leave);

class MouseInputOptions {
  final MouseListenerCallback? listen;
  final MouseListenerCallback? unlisten;
  MouseInputOptions({this.listen, this.unlisten});
}

typedef KeyListenerCallback = void Function(
    void Function(int) down, void Function(int) up, void Function(String) press);

class KeyboardInputOptions {
  final KeyListenerCallback? listen;
  final KeyListenerCallback? unlisten;
  KeyboardInputOptions({this.listen, this.unlisten});
}
