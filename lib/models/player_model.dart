import 'package:flutter/cupertino.dart';

import 'position_model.dart';

class Player {
  int position = 0;
  Position? offsetPosition;
  bool inTurn = false;
  String? name;
  AssetImage image;
  late List<Position> positionsToAnimate;

  Player({
    required this.image,
    required this.inTurn,
    required this.name,
  });

  void changePosition(int newPosition, Position newOffsetPosition,
      List<Position> positionsToAnimate) {
    this.position = newPosition;
    this.offsetPosition = newOffsetPosition;
    this.positionsToAnimate = positionsToAnimate;
  }
}
