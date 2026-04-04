class EventInfo {
  String type;
  bool bubbles;
  bool cancelable;
  EventInfo(this.type, {this.bubbles = true, this.cancelable = true});
}
