import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/constants.dart';
import '../models/models.dart';

class PlayerStatusWidget extends StatefulWidget {
  final Player player;
  final bool isFirstPlayer;

  const PlayerStatusWidget({
    Key? key,
    required this.player,
    required this.isFirstPlayer,
  }) : super(key: key);

  @override
  _PlayerStatusWidgetState createState() => _PlayerStatusWidgetState();
}

class _PlayerStatusWidgetState extends State<PlayerStatusWidget> {
  get borderColor => !widget.player.inTurn
      ? SnackColors.disabled
      : widget.isFirstPlayer
          ? SnackColors.red
          : SnackColors.purple;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Positioned(
            left: 65 / 2,
            child: Container(
              height: 45,
              width: 180,
              decoration: BoxDecoration(
                color: SnackColors.blueDark,
                border: Border.all(color: borderColor, width: 3),
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(100),
                ),
                boxShadow: SnackShadows.boxShadow,
              ),
              child: Center(
                child: Text(
                  widget.player.name ?? 'Jogador',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 65,
              height: 65,
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor, width: 3),
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    image: widget.player.image,
                    colorFilter: widget.player.inTurn
                        ? null
                        : ColorFilter.mode(Colors.white, BlendMode.color),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1, 4),
                      color: SnackColors.blueDark.withOpacity(0.8),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 55,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: SnackColors.blueDark,
                border: Border.all(
                  color: borderColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10),
                  right: Radius.circular(10),
                ),
                boxShadow: SnackShadows.boxShadow,
              ),
              padding: EdgeInsets.all(3),
              child: Text(
                '${widget.player.position}',
                style: TextStyle(
                  color: SnackColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
