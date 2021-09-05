import 'package:cobras_e_escadas/constants/constants.dart';
import 'package:cobras_e_escadas/models/cobraEscadas.dart';
import 'package:flutter/material.dart';

class RollDiceOverlayWidget extends StatefulWidget {
  const RollDiceOverlayWidget({Key? key}) : super(key: key);

  @override
  _RollDiceOverlayWidgetState createState() => _RollDiceOverlayWidgetState();
}

class _RollDiceOverlayWidgetState extends State<RollDiceOverlayWidget> {
  final CobraEscadas cobraEscadas = CobraEscadas();
  late int randomResult;

  @override
  void initState() {
    randomResult = cobraEscadas.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1)).then((value) {
      Navigator.of(context).pop(randomResult);
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: SnackDices.dice, width: 170),
        Text(
          '$randomResult',
          style: TextStyle(
            color: SnackColors.white,
            fontSize: 70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
