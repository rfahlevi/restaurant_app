// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:restaurant_app/theme/colors.dart';
import 'package:restaurant_app/theme/text_style.dart';

class ButtonChildLoading extends StatelessWidget {
  final Color circularColor;
  final TextStyle? labelTextStyle;
  const ButtonChildLoading({
    Key? key,
    this.circularColor = AppColors.white,
    this.labelTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 18,
          height: 18,
          margin: const EdgeInsets.only(right: 7),
          child: CircularProgressIndicator(
            color: circularColor,
          ),
        ),
        Text('Loading', style: labelTextStyle ?? AppTextStyle.whiteRegular),
      ],
    );
  }
}
