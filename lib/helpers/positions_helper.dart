import '../models/offset_position_model.dart';

class PositionsHelper {
  static List<OffsetPosition> generatePositions({int size: 10}) {
    int position = 0;
    bool isForward = true;
    var positions = <OffsetPosition>[];

    for (var y = 0; y < size; y++) {
      for (var x = 0; x < size; x++) {
        var pos = OffsetPosition(
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
