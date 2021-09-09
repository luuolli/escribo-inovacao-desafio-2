import 'package:cobras_e_escadas/helpers/helpers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Load level', () async {
    var level = await LevelLoaderHelper.loadLevel(1);

    print(level.checkHasAction(2));
  });
}
