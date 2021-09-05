import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/board_component.dart';
import '../components/dice_component.dart';
import '../components/player_status_component.dart';
import '../constants/constants.dart';
import '../models/models.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final CobraEscadas cobraEscadas = CobraEscadas();

  void changePlayerPosition(Player player, int value) {
    setState(() {
      var oldPosition = player.position;
      var newPosition = oldPosition + value;

      var positions = cobraEscadas.level.getPositionsBetween(
        oldPosition,
        newPosition,
      );

      var extraPosition = cobraEscadas.level.checkPosition(newPosition)?.end;
      if (extraPosition != null) {
        var extraOffsetPosition =
            cobraEscadas.level.getOffetPositionFromPosition(extraPosition);
        positions.add(extraOffsetPosition);
      }

      player.changePosition(
        newPosition,
        cobraEscadas.level.getOffetPositionFromPosition(newPosition),
        positions,
      );

      cobraEscadas.changeTurn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(
            gradient: cobraEscadas.player1.inTurn
                ? SnackGradients.red
                : SnackGradients.purple,
            image: DecorationImage(image: SnackImages.background),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
                  top: 40,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 240,
                      child: Center(
                        child: PlayerStatusWidget(
                          player: cobraEscadas.player1,
                          isFirstPlayer: true,
                        ),
                      ),
                    ),
                    DiceWidget(
                      lastSumDice:
                          cobraEscadas.dice1.value + cobraEscadas.dice2.value,
                      isActive: cobraEscadas.player1.inTurn,
                      isMainPlayer: true,
                      onPlayed: (value) {
                        changePlayerPosition(cobraEscadas.player1, value);
                      },
                    ),
                  ],
                ),
              ), //Player 1
              Expanded(
                child: BoardWidget(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
                  bottom: 40,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DiceWidget(
                      lastSumDice:
                          cobraEscadas.dice1.value + cobraEscadas.dice2.value,
                      isMainPlayer: false,
                      isActive: cobraEscadas.player2.inTurn,
                      onPlayed: (value) {
                        changePlayerPosition(cobraEscadas.player2, value);
                      },
                    ),
                    Container(
                      width: 240,
                      child: Center(
                        child: PlayerStatusWidget(
                          player: cobraEscadas.player2,
                          isFirstPlayer: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ), //Player 2
            ],
          ),
        ),
      ),
    );
  }
}
