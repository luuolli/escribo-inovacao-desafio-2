import 'dart:async';

import 'package:cobras_e_escadas/constants/images.dart';

class MainPlayerChoiseController {
  var _charterController = StreamController<SnackCharters>();

  StreamSink<SnackCharters> get mainPlayerCharterChoosseSink =>
      _charterController.sink;
  Stream<SnackCharters> get mainPlayerCharterChooseStream =>
      _charterController.stream;
}
