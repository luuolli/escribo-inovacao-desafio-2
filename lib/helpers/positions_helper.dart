import '../models/position_model.dart';

class PositionsHelper {
  static List<Position> generatePositions({int size: 10}) {
    int position = 0;
    bool isForward = true;
    var positions = <Position>[];

    for (var y = 0; y < size; y++) {
      for (var x = 0; x < size; x++) {
        var pos = Position(
          position: position++,
          axisX: isForward ? x : (x - (size - 1)).abs(),
          axisY: y,
        );
        positions.add(pos);
      }
      isForward = !isForward;
    }
    return positions;
  }
}
