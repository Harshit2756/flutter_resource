import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';
import '../colors.dart';

class HListTileTheme {
  static ListTileThemeData lightListTileTheme = const ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(horizontal: HSizes.sm8),
    iconColor: HColors.black,
    textColor: HColors.black,
    titleTextStyle: TextStyle(
      fontSize: HSizes.fontSizeMd16,
      color: HColors.black,
      fontWeight: FontWeight.w500,
    ),
    subtitleTextStyle: TextStyle(
      fontSize: HSizes.fontSizeSm14,
      color: HColors.darkGrey,
    ),
  );

  HListTileTheme._();
}
