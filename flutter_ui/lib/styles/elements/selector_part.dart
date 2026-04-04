class SelectorPart {
  SelectorPart? parent;
  String? pseudoClass;
  String? className;
  String? id;
  String? nodeName;
  bool direct = false;

  SelectorPart();

  List<String>? get classNameParts => className?.split(".");

  @override
  String toString() {
    String s = "";
    if (id != null) s += "#$id";
    if (nodeName != null) s += nodeName!;
    if (className != null) s += ".$className";
    if (pseudoClass != null) s += ":$pseudoClass";
    return s;
  }
}
