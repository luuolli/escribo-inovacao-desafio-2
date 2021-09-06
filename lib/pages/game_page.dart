import 'package:cobras_e_escadas/components/components.dart';
import 'package:cobras_e_escadas/helpers/helpers.dart';
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

  Future<void> showTurnMessage(BuildContext context, String message) async {
    await showDialog(
        // barrierColor: Colors.transparent,
        context: context,
        builder: (_) {
          return TurnMessageOverlayWidget(message: message);
        });
  }

  Future<void> changePlayerPosition(
    Player player,
    int value, {
    BuildContext? buildContext,
  }) async {
    List<Position> positions = [];

    var positionFrom = player.position;
    var positionTo = positionFrom + value;

    positions = cobraEscadas.level.getPositionsBetween(
      positionFrom,
      positionTo - 1,
    );

    // Check if has action
    var extraPosition = cobraEscadas.level.checkHasAction(positionTo);
    if (extraPosition != null) {
      if (extraPosition.objectLevelType == ObjectLevelType.stair) {
        await showTurnMessage(context, 'Você subiu a escada');
      }
      if (extraPosition.objectLevelType == ObjectLevelType.snack) {
        await showTurnMessage(context, 'Você foi comido pela cobra');
      }
      var extraOffsetPosition =
          cobraEscadas.level.getOffetPositionFromIndex(extraPosition.end - 1);
      positions.add(extraOffsetPosition);
      positionTo = positions.last.position;
    }

    //Change player position
    player.changePosition(
      positionTo,
      cobraEscadas.level.getOffetPositionFromIndex(positionTo - 1),
      positions,
    );

    // Check if can play again
    if (cobraEscadas.canPlayAgain) {
      setState(() {});
      await showTurnMessage(context, 'Jogue novamente');
    } else {
      cobraEscadas.changeTurn();
      setState(() {});
    }
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
