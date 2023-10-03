// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/src/authentication/data/local_datasource/auth_local_datasource.dart';
import 'package:restaurant_app/src/restaurant/presentation/home_page.dart';
import 'package:restaurant_app/theme/colors.dart';
import 'package:restaurant_app/theme/text_style.dart';

class AppAlert {
  static logoutAlert(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            'Confirmation',
            style: AppTextStyle.blackBold.copyWith(
              fontSize: 18,
            ),
          ),
          content: Text(
            'Are you sure want to logout?',
            style: AppTextStyle.blackRegular,
          ),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: [
            SizedBox(
              width: 75,
              height: 30,
              child: ElevatedButton(
                  onPressed: () async {
                    final isLogout = await AuthLocalDatasource.deleteToken();
                    if (isLogout) {
                      context.pushReplacement(HomePage.routeName);
                    }
                    context.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(
                      color: AppColors.black,
                    ),
                  ),
                  child: Text(
                    'Yes',
                    style: AppTextStyle.blackMedium.copyWith(
                      fontSize: 14,
                    ),
                  )),
            ),
            SizedBox(
              width: 75,
              height: 30,
              child: ElevatedButton(
                  onPressed: () => context.pop(),
                  child: Text(
                    'No',
                    style: AppTextStyle.whiteMedium.copyWith(
                      fontSize: 14,
                    ),
                  )),
            ),
          ],
        );
      },
    );
  }
}
