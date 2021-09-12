import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  void show({
    required String title,
    required String descrption,
  }) {
    Get.snackbar(
      title,
      descrption,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      borderRadius: defaultRadius,
    );
  }
}
