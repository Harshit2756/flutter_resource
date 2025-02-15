import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';
import '../colors.dart';

class HFloatingActionButtonTheme {
  static FloatingActionButtonThemeData lightFloatingActionButtonTheme =
      FloatingActionButtonThemeData(
    backgroundColor: HColors.primary,
    foregroundColor: HColors.light,
    iconSize: HSizes.iconMd24,
    elevation: 0,
    hoverColor: HColors.primary.withValues(alpha: 0.8),
    focusColor: HColors.primary.withValues(alpha: 0.8),
    splashColor: HColors.primary.withValues(alpha: 0.8),
    highlightElevation: 0,
    disabledElevation: 0,
    extendedTextStyle: const TextStyle(
      fontSize: 16,
      color: HColors.light,
      fontWeight: FontWeight.w600,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(HSizes.buttonRadius30),
    ),
  );

  HFloatingActionButtonTheme._();
}
