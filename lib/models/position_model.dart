class Position {
  int position;
  int axisX;
  int axisY;

  Position({
    required this.position,
    required this.axisX,
    required this.axisY,
  });

  @override
  String toString() {
    return "Position: ${position + 1} AxisX: $axisX, AxisY: $axisY";
  }
}
