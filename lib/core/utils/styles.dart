import 'package:car_rental_app/core/utils/app_colors.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/font_weight_helper.dart';
import 'package:flutter/material.dart';

class TextStyles {
  TextStyles._();
  static TextStyle font30WhiteSemiBold = TextStyle(
    fontFamily: AppStrings.roboto,
    color: AppColors.white,
    fontSize: 30,
    fontWeight: FontWeightHelper.semiBold,
    height: 1.2,
  );
  static TextStyle font18WhiteBold = TextStyle(
    fontFamily: AppStrings.roboto,
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14WhiteRegular = TextStyle(
    fontFamily: AppStrings.roboto,
    color: AppColors.white,
    fontSize: 14.4,
    fontWeight: FontWeightHelper.regular,
  );
}
