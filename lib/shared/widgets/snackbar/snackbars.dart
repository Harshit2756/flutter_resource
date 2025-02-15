import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors.dart';

class HSnackbars {
  static void showErrorSnackbar({
    String title = 'Error : ',
    required String message,
    String buttonText = 'Dismiss',
    VoidCallback? onPressed,
    SnackPosition snackPosition = SnackPosition.TOP,
    Duration? duration,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: snackPosition,
      backgroundColor: HColors.error,
      colorText: Colors.white,
      duration: duration ?? const Duration(seconds: 3),
      mainButton: onPressed != null
          ? TextButton(
              child: Text(buttonText),
              onPressed: () => onPressed,
            )
          : null,
    );
  }

  static void showInfoSnackbar({
    String title = 'Info : ',
    required String message,
    String buttonText = 'Dismiss',
    VoidCallback? onPressed,
    SnackPosition snackPosition = SnackPosition.TOP,
    Duration? duration,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: snackPosition,
      backgroundColor: HColors.info,
      colorText: Colors.white,
      duration: duration ?? const Duration(seconds: 3),
      mainButton: onPressed != null
          ? TextButton(
              child: Text(buttonText),
              onPressed: () => onPressed,
            )
          : null,
    );
  }

  static void showSuccessSnackbar({
    String title = 'Success : ',
    required String message,
    String buttonText = 'Dismiss',
    VoidCallback? onPressed,
    SnackPosition snackPosition = SnackPosition.TOP,
    Duration? duration,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: snackPosition,
      backgroundColor: HColors.success,
      colorText: Colors.white,
      duration: duration ?? const Duration(seconds: 3),
      mainButton: onPressed != null
          ? TextButton(
              child: Text(buttonText),
              onPressed: () => onPressed,
            )
          : null,
    );
  }

  static void showWarningSnackbar({
    String title = 'Warning : ',
    required String message,
    String buttonText = 'Dismiss',
    VoidCallback? onPressed,
    SnackPosition snackPosition = SnackPosition.TOP,
    Duration? duration,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: snackPosition,
      backgroundColor: HColors.warning,
      colorText: Colors.white,
      duration: duration ?? const Duration(seconds: 3),
      mainButton: onPressed != null
          ? TextButton(
              child: Text(buttonText),
              onPressed: () => onPressed,
            )
          : null,
    );
  }
}
