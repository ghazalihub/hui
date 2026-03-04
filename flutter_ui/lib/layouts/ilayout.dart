import '../geom/size.dart';
import '../core/component.dart';

abstract class ILayout {
  Size measure();
  void repositionChildren();
  void layout(Size size);
  Component? get container;
  set container(Component? value);
  bool get disabled;
  set disabled(bool value);
}
