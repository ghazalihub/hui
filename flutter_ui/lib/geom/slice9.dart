import 'rectangle.dart';

class Slice9Rects {
  final List<Rectangle> src, dst;
  Slice9Rects({required this.src, required this.dst});
}

class Slice9 {
  static Slice9Rects buildRects(double w, double h, double bitmapWidth,
      double bitmapHeight, Rectangle slice) {
    List<Rectangle> srcRects = buildSrcRects(bitmapWidth, bitmapHeight, slice);
    List<Rectangle> dstRects = buildDstRects(w, h, srcRects);
    return Slice9Rects(src: srcRects, dst: dstRects);
  }

  static List<Rectangle> buildSrcRects(
      double bitmapWidth, double bitmapHeight, Rectangle slice) {
    double x1 = slice.left, y1 = slice.top, x2 = slice.right, y2 = slice.bottom;
    return [
      Rectangle(0, 0, x1, y1),
      Rectangle(x1, 0, x2 - x1, y1),
      Rectangle(x2, 0, bitmapWidth - x2, y1),
      Rectangle(0, y1, x1, y2 - y1),
      Rectangle(x1, y1, x2 - x1, y2 - y1),
      Rectangle(x2, y1, bitmapWidth - x2, y2 - y1),
      Rectangle(0, y2, x1, bitmapHeight - y2),
      Rectangle(x1, y2, x2 - x1, bitmapHeight - y2),
      Rectangle(x2, y2, bitmapWidth - x2, bitmapHeight - y2)
    ];
  }

  static List<Rectangle> buildDstRects(
      double w, double h, List<Rectangle> srcRects) {
    return [
      Rectangle(0, 0, srcRects[0].width, srcRects[0].height),
      Rectangle(srcRects[0].width, 0, w - srcRects[0].width - srcRects[2].width,
          srcRects[1].height),
      Rectangle(
          w - srcRects[2].width, 0, srcRects[2].width, srcRects[2].height),
      Rectangle(0, srcRects[0].height, srcRects[3].width,
          h - srcRects[0].height - srcRects[6].height),
      Rectangle(
          srcRects[3].width,
          srcRects[0].height,
          w - srcRects[3].width - srcRects[5].width,
          h - srcRects[1].height - srcRects[7].height),
      Rectangle(w - srcRects[5].width, srcRects[2].height, srcRects[5].width,
          h - srcRects[2].height - srcRects[8].height),
      Rectangle(0, h - srcRects[6].height, srcRects[6].width, srcRects[6].height),
      Rectangle(srcRects[6].width, h - srcRects[7].height,
          w - srcRects[6].width - srcRects[8].width, srcRects[7].height),
      Rectangle(w - srcRects[8].width, h - srcRects[8].height, srcRects[8].width,
          srcRects[8].height)
    ];
  }
}
