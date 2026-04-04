class CodeBuilder {
  final List<String> _lines = [];
  CodeBuilder();
  void addLine(String line) => _lines.add(line);
  @override
  String toString() => _lines.join("\n");
}
