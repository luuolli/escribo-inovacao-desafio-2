import 'dart:convert';

import 'package:cobras_e_escadas/helpers/helpers.dart';

class BoardObject {
  late final int begin;
  late final int end;
  late final ObjectLevelType? objectLevelType;
  BoardObject({
    required this.begin,
    required this.end,
    this.objectLevelType,
  });

  factory BoardObject.fromMap(Map<String, dynamic> map) {
    return BoardObject(
      begin: map['begin'] as int,
      end: map['end'] as int,
      objectLevelType: ObjectLevelType.values
          .where((element) =>
              element.toString() == "ObjectLevelType.${map['type']}")
          .first,
    );
  }
  factory BoardObject.fromJson(String source) =>
      BoardObject.fromMap(json.decode(source));

  @override
  String toString() =>
      'BoardObject(begin: $begin, end: $end, objectLevelType: $objectLevelType)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoardObject &&
        other.begin == begin &&
        other.end == end &&
        other.objectLevelType == objectLevelType;
  }

  @override
  int get hashCode => begin.hashCode ^ end.hashCode ^ objectLevelType.hashCode;
}
