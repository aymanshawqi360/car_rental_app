import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  TextStyles._();
  static TextStyle font30WhiteSemiBold = TextStyle(
    fontFamily: AppStrings.roboto,
    color: ColorsManager.white,
    fontSize: 30,
    fontWeight: FontWeightHelper.semiBold,
    height: 1.2,
  );
  static TextStyle font18WhiteBold = TextStyle(
    fontFamily: AppStrings.roboto,
    color: ColorsManager.white,
    fontSize: 18,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font14WhiteRegular = TextStyle(
    fontFamily: AppStrings.roboto,
    color: ColorsManager.white,
    fontSize: 14.4,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font24BlackSemiBold = TextStyle(
    fontFamily: AppStrings.roboto,
    color: ColorsManager.black,
    fontSize: 24.0,
    height: 1.2,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font14GrayRegular = TextStyle(
    fontFamily: AppStrings.roboto,
    color: ColorsManager.gray,
    fontSize: 14.0,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font14OnyxRegular = TextStyle(
    fontFamily: AppStrings.roboto,
    color: ColorsManager.onyx,
    fontSize: 14.0,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font18BlackBold = TextStyle(
    // fontFamily: AppStrings.roboto,
    color: ColorsManager.black,
    fontSize: 18.0,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font16GrayRegular = TextStyle(
    fontFamily: AppStrings.roboto,
    color: ColorsManager.gray,
    fontSize: 16.0,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font16OnyxRegular = TextStyle(
    fontFamily: AppStrings.roboto,
    color: ColorsManager.onyx,
    fontSize: 16.0,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font30BlackSemiBold = TextStyle(
    fontFamily: AppStrings.roboto,
    color: ColorsManager.black,
    fontSize: 30.0,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font14BlackSemiBold = TextStyle(
    fontFamily: AppStrings.roboto,
    color: ColorsManager.black,
    fontSize: 14.0,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font12GrayRegular = TextStyle(
    fontFamily: AppStrings.roboto,
    color: ColorsManager.gray,
    fontSize: 12.4,
    fontWeight: FontWeightHelper.regular,
    height: 1.5,
  );
  static TextStyle font14LightGrayRegular = TextStyle(
    fontFamily: AppStrings.roboto,
    color: ColorsManager.gray,
    fontSize: 14.0,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font28BlackSemiBold = TextStyle(
    fontFamily: AppStrings.roboto,
    color: ColorsManager.black,
    fontSize: 28.6,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font15BlackMedium = TextStyle(
    fontFamily: AppStrings.roboto,
    color: ColorsManager.black,
    fontSize: 15.0,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle font10WhiteBold = TextStyle(
    //fontFamily: AppStrings.roboto,
    color: ColorsManager.white,
    fontSize: 10.0.r,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font13BlackSemiBold = TextStyle(
    fontFamily: AppStrings.roboto,
    color: ColorsManager.black,
    fontSize: 13.0.r,
    fontWeight: FontWeightHelper.semiBold,
  );
}
