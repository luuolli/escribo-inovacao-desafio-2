class OffsetPosition {
  int index;
  int position;
  int axisX;
  int axisY;

  OffsetPosition({
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
