import 'component.dart';

abstract class IClonable<T> {
  T cloneComponent();
  T self();
  void postCloneComponent(Component c);
}
