import 'package:flutter/material.dart';
import 'package:restaurant_app/theme/text_style.dart';

class AppLogo {
  static final title = Text(
    'Reztto!',
    style: AppTextStyle.blackBold.copyWith(fontSize: 40),
  );

  static final subtitle = Text(
    'Find your favourite restaurant',
    style: AppTextStyle.blackRegular.copyWith(fontSize: 16),
  );
}
