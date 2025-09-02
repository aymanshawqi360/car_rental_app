import 'package:car_rental_app/core/utils/app_colors.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RememberMeAndForgotPassword extends StatelessWidget {
  const RememberMeAndForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.bodyHeight * 0.1,
      child: Padding(
        padding: EdgeInsets.only(
          left: context.screenWidth * 0.01,
          right: context.screenWidth * 0.01,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: context.screenWidth * 0.042,
                  height: context.screenHeight * 0.021,
                  decoration: BoxDecoration(
                    color: ColorsManager.onyx,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AssetsManager.checkBox,
                      width: 10,
                      height: 10,

                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                horizontalSpacing(context.screenWidth * 0.02),
                Text(
                  AppStrings.rememberMe,
                  style: TextStyles.font14GrayRegular,
                ),
              ],
            ),
            Text(
              AppStrings.forgotPassword,
              style: TextStyles.font14OnyxRegular,
            ),
          ],
        ),
      ),
    );
  }
}
