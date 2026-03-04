import 'component.dart';

abstract class IComponentContainer {
  Component addComponent(Component child);
  Component removeComponent(Component child,
      {bool dispose = true, bool invalidate = true});
  bool containsComponent(Component child);
}
