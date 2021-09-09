import 'package:flutter/cupertino.dart';

import 'offset_position_model.dart';

class Player {
  int position = 1;
  OffsetPosition? offsetPosition;
  bool inTurn = false;
  String? name;
  AssetImage image;
  List<OffsetPosition>? positionsToJump;

  Player({
    required this.image,
    required this.inTurn,
    required this.name,
  });

  void changePositions(
    int positionTo,
    OffsetPosition newOffsetPosition,
    List<OffsetPosition> positionsToAnimate,
  ) {
    this.position = positionTo;
    this.offsetPosition = newOffsetPosition;
    this.positionsToJump = positionsToAnimate;
  }
}
