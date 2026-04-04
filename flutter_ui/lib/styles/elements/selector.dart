import 'selector_part.dart';

class Selector {
  List<SelectorPart> parts = [];

  Selector(String s) {
    s = s.replaceAll(">", " > ");
    List<String> p = s.split(" ");
    SelectorPart? parent;
    bool nextDirect = false;

    for (var i in p) {
      i = i.trim();
      if (i.isEmpty) continue;
      if (i == ">") {
        nextDirect = true;
        continue;
      }

      var current = SelectorPart();
      if (nextDirect) {
        current.direct = true;
        nextDirect = false;
      }
      current.parent = parent;

      var p1 = i.split(":");
      if (p1.length > 1) current.pseudoClass = p1[1];

      var main = p1[0];
      if (main.startsWith(".")) {
        current.className = main.substring(1);
      } else {
        var p2 = main.split(".");
        if (p2[0].startsWith("#")) {
          current.id = p2[0].substring(1);
        } else {
          current.nodeName = p2[0].toLowerCase();
        }
        if (p2.length > 1) current.className = p2[1];
      }

      parts.add(current);
      parent = current;
    }
  }

  @override
  String toString() => parts.join(" ");
}
