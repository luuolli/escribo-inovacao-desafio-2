import 'package:flutter/material.dart';

abstract class SnackColors {
  static Color get primary => Color(0xFFFFFFFF);
  static Color get blueDark => Color(0xFF292935);
  static Color get accent => Color(0xFFFFFFFF);
  static Color get white => Color(0xFFFFFFFF);
  static Color get disabled => Color(0xFF828282);
  static Color get red => Color(0xFFD63640);
  static Color get redDark => Color(0xFFA4040E);
  static Color get purple => Color(0xFF6A68B5);
  static Color get purpleDark => Color(0xFF383683);
}

abstract class SnackGradients {
  static LinearGradient get red => LinearGradient(
        colors: [
          Color(0xFF773640),
          SnackColors.red,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
  static LinearGradient get purple => LinearGradient(
        colors: [
          Color(0xFF383677),
          SnackColors.purple,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
}

abstract class SnackShadows {
  static List<BoxShadow> get boxShadow => [
        BoxShadow(
          offset: Offset(1, 4),
          color: SnackColors.blueDark.withOpacity(1),
        ),
      ];
}
