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

  Future<void> showWinnerMessage(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (_) {
          return WinnerOverlayWidget();
        });
  }

  Future<void> changePlayerPosition(
    Player player,
    int value, {
    BuildContext? buildContext,
  }) async {
    var positionFrom = player.position;
    var positionTo = positionFrom + value;
    var positionsToJump =
        cobraEscadas.level.getPositionsToRun(positionFrom, positionTo);

    player.positionsToJump = positionsToJump;

    player.changePositions(
      positionsToJump.last.position,
      cobraEscadas.level.getOffsetPositionFromIndex(positionsToJump.last.index),
      positionsToJump,
    );

    if (player.offsetPosition?.position == 100) {
      showWinnerMessage(context);
    }

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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            gradient: cobraEscadas.player1.inTurn
                ? SnackGradients.red
                : SnackGradients.purple,
            image: DecorationImage(
              image: SnackImages.background1,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.xor,
              ),
            ),
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
