class Position {
  int index;
  int position;
  int axisX;
  int axisY;

  Position({
    required this.index,
    required this.position,
    required this.axisX,
    required this.axisY,
  });

  @override
  String toString() {
    return "Index: $index Position: $position AxisX: $axisX, AxisY: $axisY";
  }
}
