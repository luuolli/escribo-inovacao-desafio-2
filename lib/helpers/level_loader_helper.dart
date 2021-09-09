import 'dart:convert';

import 'package:cobras_e_escadas/models/board_object_model.dart';
import 'package:cobras_e_escadas/models/level_model.dart';
import 'package:flutter/services.dart';

class LevelLoaderHelper {
  static Future<Level> loadLevel(int level) async {
    var response =
        await rootBundle.loadString("assets/levels/level$level.json");
    var jsonObject = jsonDecode(response);

    var items = jsonObject['objects'] as List;

    var boardObjects =
        items.map<BoardObject>((map) => BoardObject.fromMap(map)).toList();
    var pathImage = jsonObject['path-image'];
    var size = jsonObject['size'];

    return Level(level,
        boardObjects: boardObjects, size: size, pathImage: pathImage);
  }
}
