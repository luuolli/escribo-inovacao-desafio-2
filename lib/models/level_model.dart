import 'package:cobras_e_escadas/helpers/helpers.dart';
// import 'package:cobras_e_escadas/models/board_object_model.dart';

import 'models.dart';

class Level {
  late final List<BoardObject> boardObjects;
  late final List<Position> positions;
  late final String pathImage;
  late final size;

  BoardObject? checkPosition(int newPosition) {
    try {
      return boardObjects.firstWhere((object) => object.begin == newPosition);
    } catch (e) {
      return null;
    }
  }

  Position getOffetPositionFromPosition(int position) {
    return positions[position - 1];
  }

  List<Position> getPositionsBetween(int start, int end) {
    return positions.sublist(start, end + 1);
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
