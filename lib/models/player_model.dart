import 'package:flutter/cupertino.dart';

import 'position_model.dart';

class Player {
  int position = 1;
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

  void changePosition(
    int positionTo,
    Position newOffsetPosition,
    List<Position> positionsToAnimate,
  ) {
    this.position = positionTo;
    this.offsetPosition = newOffsetPosition;
    this.positionsToAnimate = positionsToAnimate;
  }
}
