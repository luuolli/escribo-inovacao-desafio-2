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
    return "Index:$index Position: $position AxisX: $axisX, AxisY: $axisY";
  }
}

class PositionsHelper {
  static List<Position> generatePositions({int size: 10}) {
    int position = 0;
    bool isForward = true;
    var positions = <Position>[];

    for (var y = 0; y < size; y++) {
      for (var x = 0; x < size; x++) {
        var pos = Position(
          index: position,
          position: position + 1,
          axisX: isForward ? x : (x - (size - 1)).abs(),
          axisY: y,
        );
        positions.add(pos);
        position++;
      }
      isForward = !isForward;
    }
    return positions;
  }
}

void main() {
  var positions = PositionsHelper.generatePositions();

  positions.forEach(print);
}
