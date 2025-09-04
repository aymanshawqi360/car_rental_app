import 'package:car_rental_app/core/utils/app_colors.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText;
  final double? vertical;
  final double? horizontal;
  final BorderRadius? borderRadius;
  const AppTextFormField({
    super.key,
    this.hintText,
    this.vertical,
    this.horizontal,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: horizontal ?? context.screenWidth / 20,
          vertical: vertical ?? context.screenHeight / 60,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          // gapPadding: 4.0,
          borderSide: BorderSide(color: ColorsManager.lightGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorsManager.lightGray),
        ),
        hintText: hintText ?? "Email/Phone Number",
        hintStyle: TextStyles.font14GrayRegular,
        filled: true,
        fillColor: ColorsManager.white,
      ),
    );
  }
}
