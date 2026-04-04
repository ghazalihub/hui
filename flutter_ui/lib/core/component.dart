import '../geom/size.dart';
import '../validation/ivalidating.dart';
import '../validation/invalidation_flags.dart';

abstract class Component implements IValidating {
  Component? _parentComponent;
  Component? get parentComponent => _parentComponent;
  set parentComponent(Component? value) {
    _parentComponent = value;
  }

  final List<Component> _children = [];
  List<Component> get childComponents => _children;

  String? _id;
  @override
  String get id => _id ?? "";
  @override
  set id(String value) => _id = value;

  int _depth = -1;
  @override
  int get depth => _depth;
  @override
  set depth(int value) => _depth = value;

  double left = 0;
  double top = 0;
  double? _width;
  double? get width => _width;
  set width(double? value) {
    _width = value;
    invalidateComponentLayout();
  }

  double? _height;
  double? get height => _height;
  set height(double? value) {
    _height = value;
    invalidateComponentLayout();
  }

  bool _hidden = false;
  bool get hidden {
    if (_hidden) return true;
    return _parentComponent?.hidden ?? false;
  }

  set hidden(bool value) {
    if (_hidden == value) return;
    _hidden = value;
    invalidateComponentLayout();
    if (value) {
      onHidden();
    } else {
      onShown();
    }
  }

  bool _includeInLayout = true;
  bool get includeInLayout => _includeInLayout && !_hidden;
  set includeInLayout(bool value) {
    _includeInLayout = value;
    invalidateComponentLayout();
  }

  bool _isDisposed = false;
  bool get isDisposed => _isDisposed;

  bool layoutDirty = false;
  bool styleDirty = false;
  bool paintDirty = false;

  Component() {
    // Initializers
  }

  Component addComponent(Component child) {
    child.parentComponent = this;
    _children.add(child);
    onComponentAdded(child);
    invalidateComponentLayout();
    return child;
  }

  Component addComponentAt(Component child, int index) {
    child.parentComponent = this;
    _children.insert(index, child);
    onComponentAdded(child);
    invalidateComponentLayout();
    return child;
  }

  Component removeComponent(Component child,
      {bool dispose = true, bool invalidate = true}) {
    if (_children.remove(child)) {
      child.parentComponent = null;
      onComponentRemoved(child);
      if (dispose) child.disposeComponent();
      if (invalidate) invalidateComponentLayout();
    }
    return child;
  }

  Component removeComponentAt(int index,
      {bool dispose = true, bool invalidate = true}) {
    if (index >= 0 && index < _children.length) {
      Component child = _children.removeAt(index);
      child.parentComponent = null;
      onComponentRemoved(child);
      if (dispose) child.disposeComponent();
      if (invalidate) invalidateComponentLayout();
      return child;
    }
    return ComponentStub(); // Should handle error appropriately
  }

  void removeAllComponents({bool dispose = true}) {
    while (_children.isNotEmpty) {
      removeComponent(_children[0], dispose: dispose, invalidate: false);
    }
    invalidateComponentLayout();
  }

  bool containsComponent(Component child) {
    return _children.contains(child);
  }

  int getComponentIndex(Component child) => _children.indexOf(child);

  void setComponentIndex(Component child, int index) {
    if (_children.remove(child)) {
      _children.insert(index, child);
      invalidateComponentLayout();
    }
  }

  Component? getComponentAt(int index) =>
      index >= 0 && index < _children.length ? _children[index] : null;

  T? findComponent<T extends Component>(
      {String? criteria, bool recursive = true, String searchType = "id"}) {
    for (var child in _children) {
      if (_matchesSearch(child, criteria, searchType)) {
        return child as T;
      }
    }
    if (recursive) {
      for (var child in _children) {
        var match = child.findComponent<T>(
            criteria: criteria, recursive: recursive, searchType: searchType);
        if (match != null) return match;
      }
    }
    return null;
  }

  bool _matchesSearch(Component c, String? criteria, String searchType) {
    if (criteria == null) return false;
    if (searchType == "id") return c.id == criteria;
    return false;
  }

  T? findAncestor<T extends Component>(
      {String? criteria, String searchType = "id"}) {
    var p = _parentComponent;
    while (p != null) {
      if (_matchesSearch(p, criteria, searchType)) {
        return p as T;
      }
      p = p.parentComponent;
    }
    return null;
  }

  void onComponentAdded(Component child) {}
  void onComponentRemoved(Component child) {}

  void disposeComponent() {
    if (_isDisposed) return;
    _isDisposed = true;
    removeAllComponents(dispose: true);
    onDestroy();
  }

  void onReady() {}
  void onDestroy() {}
  void onHidden() {}
  void onShown() {}

  void invalidateComponent(
      [String flags = InvalidationFlags.ALL, bool recursive = false]) {
    if (flags == InvalidationFlags.LAYOUT) layoutDirty = true;
    if (flags == InvalidationFlags.STYLE) styleDirty = true;
    if (flags == InvalidationFlags.DISPLAY) paintDirty = true;
    if (flags == InvalidationFlags.ALL) {
      layoutDirty = styleDirty = paintDirty = true;
    }

    if (recursive) {
      for (var child in _children) {
        child.invalidateComponent(flags, true);
      }
    }
  }

  void invalidateComponentLayout() =>
      invalidateComponent(InvalidationFlags.LAYOUT);
  void invalidateComponentStyle() =>
      invalidateComponent(InvalidationFlags.STYLE);

  @override
  void validateComponent({bool nextFrame = true}) {
    if (styleDirty) {
      validateComponentStyle();
      styleDirty = false;
    }
    if (layoutDirty) {
      validateComponentLayout();
      layoutDirty = false;
    }
    if (paintDirty) {
      updateComponentDisplay();
      paintDirty = false;
    }
  }

  void validateComponentStyle() {}
  bool validateComponentLayout() {
    return false;
  }

  @override
  void updateComponentDisplay() {}

  @override
  bool get isComponentOffscreen => false;

  void measure(double maxWidth, double maxHeight);
  void layout(double x, double y);

  void registerEvent(String type, Function callback, [int priority = 0]) {}
  void unregisterEvents(String type) {}
  void applyAnimationKeyFrame(dynamic frames, dynamic options) {}
}

class ComponentStub extends Component {
  @override
  void measure(double maxWidth, double maxHeight) {}
  @override
  void layout(double x, double y) {}
}

abstract class Layout {
  Size measure();
  void repositionChildren();
  void layout(Size size);
  Component? container;
  bool disabled = false;
}
