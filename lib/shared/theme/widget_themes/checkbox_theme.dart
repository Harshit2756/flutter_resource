import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';
import '../colors.dart';

/// Custom Class for Light & Dark Text Themes
class HCheckboxTheme {
  /// Customizable Light Text Theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(HSizes.xs4)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return HColors.white;
      } else {
        return HColors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return HColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );

  HCheckboxTheme._(); // To avoid creating instances
}
