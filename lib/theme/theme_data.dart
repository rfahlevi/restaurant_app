import 'package:flutter/material.dart';
import 'package:restaurant_app/theme/colors.dart';

class AppThemeData {
  static final rezto = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.black),
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}
