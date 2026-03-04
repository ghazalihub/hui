class Listener {
  String type;
  Function callback;
  int priority;
  Listener(this.type, this.callback, [this.priority = 0]);
}
