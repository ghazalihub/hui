class Rectangle {
  double left, top, width, height;

  Rectangle([this.left = 0, this.top = 0, this.width = 0, this.height = 0]);

  void set(
      [double left = 0, double top = 0, double width = 0, double height = 0]) {
    this.left = left;
    this.top = top;
    this.width = width;
    this.height = height;
  }

  double get right => left + width;
  set right(double value) => width = value - left;

  double get bottom => top + height;
  set bottom(double value) => height = value - top;

  void inflate(double dx, double dy) {
    left -= dx;
    width += dx * 2;
    top -= dy;
    height += dy * 2;
  }

  bool equals(Rectangle? rc) {
    if (rc == null) return false;
    return rc.left == left &&
        rc.top == top &&
        rc.width == width &&
        rc.height == height;
  }

  bool containsPoint(double x, double y) =>
      x >= left && x < left + width && y >= top && y < top + height;

  bool containsRect(Rectangle rect) {
    if (rect.width <= 0 || rect.height <= 0) {
      return rect.left > left &&
          rect.top > top &&
          rect.right < right &&
          rect.bottom < bottom;
    } else {
      return rect.left >= left &&
          rect.top >= top &&
          rect.right <= right &&
          rect.bottom <= bottom;
    }
  }

  bool intersects(Rectangle rect) {
    double x0 = left < rect.left ? rect.left : left;
    double x1 = right > rect.right ? rect.right : right;
    if (x1 <= x0) return false;
    double y0 = top < rect.top ? rect.top : top;
    double y1 = bottom > rect.bottom ? rect.bottom : bottom;
    return y1 > y0;
  }

  Rectangle? _intersectionCache;
  Rectangle intersection(Rectangle rect, {bool noAlloc = true}) {
    if (noAlloc && _intersectionCache == null) _intersectionCache = Rectangle();
    double x0 = left < rect.left ? rect.left : left;
    double x1 = right > rect.right ? rect.right : right;
    if (x1 <= x0) {
      if (noAlloc) {
        _intersectionCache!.set();
        return _intersectionCache!;
      }
      return Rectangle();
    }
    double y0 = top < rect.top ? rect.top : top;
    double y1 = bottom > rect.bottom ? rect.bottom : bottom;
    if (y1 <= y0) {
      if (noAlloc) {
        _intersectionCache!.set();
        return _intersectionCache!;
      }
      return Rectangle();
    }
    Rectangle r = noAlloc ? _intersectionCache! : Rectangle();
    r.set(x0, y0, x1 - x0, y1 - y0);
    return r;
  }

  Rectangle copy() => Rectangle(left, top, width, height);

  @override
  String toString() =>
      "{left: $left, top: $top, bottom: $bottom, right: $right, width: $width, height: $height}";
}
