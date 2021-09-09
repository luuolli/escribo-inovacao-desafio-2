import 'package:cobras_e_escadas/helpers/helpers.dart';
import 'package:flutter_test/flutter_test.dart';

main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  var level = await LevelLoaderHelper.loadLevel(1);
  test('Check has action', () {
    var action = level.checkHasAction(2);
    expect(action?.end, 38);
  });

  test('Offset position from index', () {
    var offsetPosition = level.getOffsetPositionFromIndex(0);
    print(offsetPosition);
    expect(offsetPosition.axisX, 0);
    expect(offsetPosition.axisY, 0);
  });

  test('Get positions to run', () {
    var positions = level.getPositionsToRun(1, 8);
    print(positions);
  });

  test('Get over positions', () {
    var overPositions = level.getOverPositionsReverse(over: 3);
    print(overPositions);
  });
}
