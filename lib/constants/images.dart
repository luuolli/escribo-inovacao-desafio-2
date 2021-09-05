import 'package:flutter/material.dart';

abstract class SnackImages {
  static AssetImage get board => AssetImage('assets/board.png');
  static AssetImage get background => AssetImage('assets/bk.png');
}

abstract class SnackCharters {
  static AssetImage get charter1 => AssetImage('assets/charters/charter-1.png');
  static AssetImage get charter2 => AssetImage('assets/charters/charter-2.png');
}

abstract class SnackDices {
  static AssetImage get dice => AssetImage('assets/dices/dice.png');
  static NetworkImage get diceGif => NetworkImage(
      'https://phoneky.co.uk/thumbs/screensavers/down/games/dice_TqVKRCZq.gif');
}
