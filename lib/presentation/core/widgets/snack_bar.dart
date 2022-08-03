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
    required String description,
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

    String title() {
      switch (type) {
        case ESnackBarType.success:
          return 'Success';
        case ESnackBarType.warning:
          return 'Warning';
        case ESnackBarType.error:
          return 'Error';
      }
    }

    Get.snackbar(
      title(),
      description,
      colorText: kWhiteColor,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      borderRadius: defaultRadius,
      backgroundColor: backgroundColor(),
    );
  }
}
