import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../constants/constants.dart';
import '../helpers/helpers.dart';
import 'models.dart';

class CobraEscadas {
  static final CobraEscadas _singleton = CobraEscadas._internal();

  factory CobraEscadas() {
    return _singleton;
  }

  CobraEscadas._internal();

  late final Level level;
  late Player player1;
  late Player player2;

  final dice1 = Dice();
  final dice2 = Dice();

  bool get canPlayAgain => dice1.value == dice2.value;

  int play() {
    random(min, max) {
      var rn = new Random();
      return min + rn.nextInt(max - min);
    }

    dice1.value = random(1, 7);
    dice2.value = random(1, 7);

    return dice1.value + dice2.value;
  }

  Future<void> startGame(AssetImage player1Charter) async {
    player1 = Player(
      name: 'Jogador 1',
      image: player1Charter,
      inTurn: true,
    );

    player2 = Player(
      name: 'Jogador 2',
      image: player1Charter == SnackCharters.charter1
          ? SnackCharters.charter2
          : SnackCharters.charter1,
      inTurn: !player1.inTurn,
    );
    level = await LevelLoaderHelper.loadLevel(1);
  }

  void changeTurn() {
    player1.inTurn = !player1.inTurn;
    player2.inTurn = !player2.inTurn;
  }
}
