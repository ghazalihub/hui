abstract class IValidating {
  int get depth;
  set depth(int value);
  String get id;
  set id(String value);
  void validateComponent({bool nextFrame = true});
  void updateComponentDisplay();
  bool get isComponentOffscreen;
}
