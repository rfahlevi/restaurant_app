// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:restaurant_app/theme/colors.dart';
import 'package:restaurant_app/theme/text_style.dart';

class AuthForm extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController controller;
  const AuthForm({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: AppTextStyle.blackRegular),
        const SizedBox(height: 7),
        SizedBox(
          height: 50,
          child: TextField(
            controller: controller,
            onTapOutside: (event) => FocusScope.of(context).requestFocus(FocusNode()),
            obscureText: obscureText,
            cursorColor: AppColors.black,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hoverColor: AppColors.grey,
              fillColor: AppColors.grey,
              focusColor: AppColors.grey,
              isDense: true,
              hintText: hintText,
              hintStyle: AppTextStyle.greyRegular,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: AppColors.grey.withAlpha(100),
                ),
              ),
              enabled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: AppColors.black,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: AppColors.grey.withAlpha(100),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 14),
      ],
    );
  }
}
