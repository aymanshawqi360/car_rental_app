import 'package:car_rental_app/config/responsive/size_config.dart';
import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaButtonSigbUp extends StatelessWidget {
  const SocialMediaButtonSigbUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          onTap: () {},
          height: SizeConfig.heightButtonSocialMedia,
          color: ColorsManager.platinumGray,
          border: BoxBorder.all(color: ColorsManager.black, width: 0.1),
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsManager.appleIcon),
              horizontalSpacing(context.screenWidth / 35),
              Text(AppStrings.applePay, style: TextStyles.font14BlackSemiBold),
            ],
          ),
        ),
        verticalSpacing(context.screenHeight / 50),
        AppButton(
          onTap: () {},
          height: SizeConfig.heightButtonSocialMedia,
          color: ColorsManager.platinumGray,
          border: BoxBorder.all(color: ColorsManager.black, width: 0.1),
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsManager.googleIcon),
              horizontalSpacing(context.screenWidth / 35),
              Text(AppStrings.googlePay, style: TextStyles.font14BlackSemiBold),
            ],
          ),
        ),
      ],
    );
  }
}
