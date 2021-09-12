import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ESnackBarType {
  success,
  warning,
  error,
}

class CustomSnackBar {
  void show({
    required String title,
    required String descrption,
    ESnackBarType type = ESnackBarType.error,
  }) {
    Color backgroundColor() {
      switch (type) {
        case ESnackBarType.success:
          return kGreenColor;
        case ESnackBarType.warning:
          return kRedColor;
        case ESnackBarType.error:
          return kRedColor;
      }
    }

    Get.snackbar(
      title,
      descrption,
      colorText: kWhiteColor,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      borderRadius: defaultRadius,
      backgroundColor: backgroundColor(),
    );
  }
}
