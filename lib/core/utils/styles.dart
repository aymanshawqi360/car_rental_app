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
  static TextStyle font24BlackSemiBold = TextStyle(
    fontFamily: AppStrings.roboto,
    color: AppColors.black,
    fontSize: 24.0,
    height: 1.2,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font14GrayRegular = TextStyle(
    fontFamily: AppStrings.roboto,
    color: AppColors.gray,
    fontSize: 14.0,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font14OnyxRegular = TextStyle(
    fontFamily: AppStrings.roboto,
    color: AppColors.onyx,
    fontSize: 14.0,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font18BlackBold = TextStyle(
    // fontFamily: AppStrings.roboto,
    color: AppColors.black,
    fontSize: 18.0,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font16GrayRegular = TextStyle(
    fontFamily: AppStrings.roboto,
    color: AppColors.gray,
    fontSize: 16.0,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font16OnyxRegular = TextStyle(
    fontFamily: AppStrings.roboto,
    color: AppColors.onyx,
    fontSize: 16.0,
    fontWeight: FontWeightHelper.regular,
  );
}
