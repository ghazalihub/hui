class AnimationSequence {
  void Function()? onComplete;
  List<dynamic> builders = [];
  List<dynamic>? _activeBuilders;

  AnimationSequence();

  void add(dynamic builder) {
    if (builder == null) return;
    builders.add(builder);
  }

  void _onAnimationComplete() {
    _activeBuilders?.removeLast();
    if (_activeBuilders?.isEmpty ?? true) {
      onComplete?.call();
    }
  }

  void play() {
    if (builders.isEmpty) {
      onComplete?.call();
      return;
    }
    _activeBuilders = List.from(builders);
    for (var builder in builders) {
      builder.onComplete = _onAnimationComplete;
      builder.play();
    }
  }
}
