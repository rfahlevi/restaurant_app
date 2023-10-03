import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/theme/colors.dart';
import 'package:restaurant_app/theme/text_style.dart';

class AppFlash {
  static success({
    required BuildContext context,
    required String message,
  }) {
    showFlash(
      context: context,
      barrierDismissible: true,
      duration: const Duration(seconds: 5),
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          elevation: 0,
          forwardAnimationCurve: Curves.easeInCirc,
          reverseAnimationCurve: Curves.bounceIn,
          backgroundColor: AppColors.nastyGreen,
          position: FlashPosition.top,
          content: Text(message, style: AppTextStyle.whiteRegular),
        );
      },
    );
  }

  static error({
    required BuildContext context,
    required String message,
  }) {
    showFlash(
      context: context,
      barrierDismissible: true,
      duration: const Duration(seconds: 5),
      builder: (context, controller) {
        return FlashBar(
          controller: controller,
          elevation: 0,
          forwardAnimationCurve: Curves.easeInCirc,
          reverseAnimationCurve: Curves.bounceIn,
          backgroundColor: AppColors.red,
          position: FlashPosition.top,
          content: Text(message, style: AppTextStyle.whiteRegular),
        );
      },
    );
  }
}
