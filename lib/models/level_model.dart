import 'package:cobras_e_escadas/helpers/helpers.dart';
// import 'package:cobras_e_escadas/models/board_object_model.dart';

import 'models.dart';

class Level {
  late final List<BoardObject> boardObjects;
  late final List<Position> positions;
  late final String pathImage;
  late final size;

  BoardObject? checkHasAction(int positionTo) {
    try {
      var object =
          boardObjects.where((object) => object.begin == positionTo).first;
      return object;
    } catch (e) {
      return null;
    }
  }

  Position getOffetPositionFromIndex(int index) {
    return positions[index];
  }

  List<Position> getPositionsBetween(int start, int end) {
    return positions.sublist(start, end);
  }

  Level(
    int level, {
    required this.boardObjects,
    required this.size,
    required this.pathImage,
  }) {
    positions = PositionsHelper.generatePositions(size: size);
  }
}
