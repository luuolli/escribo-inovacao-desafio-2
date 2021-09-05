import 'package:cobras_e_escadas/components/player_component.dart';
import 'package:cobras_e_escadas/models/models.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../constants/images.dart';

class BoardWidget extends StatelessWidget {
  final CobraEscadas cobraEscadas = CobraEscadas();
  final double _padding = 0;

  BoardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width - _padding,
        height: size.width - _padding,
        decoration: BoxDecoration(
          image: DecorationImage(image: SnackImages.board),
        ),
        child: LayoutBuilder(builder: (_, constraints) {
          double size = constraints.normalize().minWidth;
          double sizePerTile = size / cobraEscadas.level.size;
          return Stack(
            children: [
              PlayerWidget(
                player: cobraEscadas.player1,
                sizeTile: sizePerTile,
                postionsToAnimate: [],
              ),
              PlayerWidget(
                player: cobraEscadas.player2,
                sizeTile: sizePerTile,
                postionsToAnimate: [],
              ),
            ],
          );
        }),
      ),
    );
  }
}
