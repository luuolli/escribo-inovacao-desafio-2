import 'dart:math';

import 'package:cobras_e_escadas/helpers/helpers.dart';
// import 'package:cobras_e_escadas/models/board_object_model.dart';

import 'models.dart';

class Level {
  late final List<BoardObject> boardObjects;
  late final List<OffsetPosition> positions;
  late final String pathImage;
  late final int size;

  int get boardLenght => pow(size, 2).toInt();

  Level(
    int level, {
    required this.boardObjects,
    required this.size,
    required this.pathImage,
  }) {
    positions = PositionsHelper.generatePositions(size: size);
  }

  /// Verify if position has object to action
  BoardObject? checkHasAction(int positionTo) {
    try {
      var object =
          boardObjects.where((object) => object.begin == positionTo).first;
      return object;
    } catch (e) {
      return null;
    }
  }

  /// Get offset position from list index;
  OffsetPosition getOffsetPositionFromIndex(int index) {
    return positions[index];
  }

  /// Get positions between iddle position and last position to run
  List<OffsetPosition> getPositionsBetween(int start, int end) {
    int over = 0;
    if (end > boardLenght) {
      // extra positions
      over = boardLenght - end;
    }
    var pos = positions.sublist(start - 1, end - over);
    return pos;
  }

  List<OffsetPosition> getOverPositionsReverse({int over: 0}) {
    var extraPositions = <OffsetPosition>[];

    for (int indexOver = 0; indexOver <= over; indexOver++) {
      extraPositions.add(positions[(boardLenght - 1) - indexOver]);
    }
    return extraPositions;
  }

  List<OffsetPosition> getPositionsToRun(int startMoviment, int endMoviment) {
    int over = 0;
    if (endMoviment > boardLenght) {
      over = (endMoviment - boardLenght).abs();
    }
    var pos = getPositionsBetween(startMoviment, endMoviment - over);

    if (over > 0) {
      var overPositions = getOverPositionsReverse(over: over);
      pos.addAll(overPositions);
    }

    var action = checkHasAction(pos.last.position);

    if (action != null) {
      var actionPosition = getOffsetPositionFromIndex(action.end - 1);
      pos.add(actionPosition);
    }

    return pos;
  }
}
