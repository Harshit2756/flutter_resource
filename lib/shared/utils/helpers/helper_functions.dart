import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HHelperFunctions {
  List<T> transformList<T>(
      List data, T Function(Map<String, dynamic>) fromJson) {
    return data.map((item) => fromJson(item as Map<String, dynamic>)).toList();
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }
}
