class Size {
  double width, height;
  Size([this.width = 0, this.height = 0]);
  void round() {
    width = width.roundToDouble();
    height = height.roundToDouble();
  }

  @override
  String toString() => '[$width x $height]';
}
