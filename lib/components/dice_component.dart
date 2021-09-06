import 'package:cobras_e_escadas/components/overlays/roll_dice_overlay_component.dart';
import 'package:cobras_e_escadas/components/overlays/turn_message_overlay.dart';
import 'package:cobras_e_escadas/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiceWidget extends StatelessWidget {
  final bool isMainPlayer;
  final bool isActive;
  final int lastSumDice;
  final Function(int value) onPlayed;

  const DiceWidget({
    Key? key,
    required this.isMainPlayer,
    required this.isActive,
    required this.onPlayed,
    required this.lastSumDice,
  }) : super(key: key);

  Future<void> showTurnMessage(BuildContext context) async {
    showDialog(
        // barrierColor: Colors.transparent,
        context: context,
        builder: (_) {
          return TurnMessageOverlayWidget(
            message: "Vez do ${isActive ? 'Jogador 1' : 'Jogador 2'}",
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: isActive
          ? () async {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) {
                    return RollDiceOverlayWidget();
                  }).then(
                (result) async {
                  onPlayed(result);
                  // await showTurnMessage(context);
                },
              );
            }
          : null,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: !isActive
                  ? SnackColors.disabled
                  : isMainPlayer
                      ? SnackColors.redDark
                      : SnackColors.purpleDark,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: SnackColors.white, width: 3),
              boxShadow: SnackShadows.boxShadow,
            ),
          ),
          Image(
            image: SnackDices.dice,
            width: 70,
          ),
          Positioned(
            bottom: -10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              decoration: BoxDecoration(
                color: !isActive
                    ? SnackColors.disabled
                    : isMainPlayer
                        ? SnackColors.redDark
                        : SnackColors.purpleDark,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: SnackColors.white, width: 2),
                boxShadow: SnackShadows.boxShadow,
              ),
              child: Text(
                "$lastSumDice",
                style: TextStyle(
                  fontSize: 8,
                  color: SnackColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
