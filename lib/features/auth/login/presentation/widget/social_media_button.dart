import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          onTap: () {},
          height: context.screenHeight / 19,
          color: ColorsManager.platinumGray,
          border: BoxBorder.all(color: ColorsManager.black, width: 0.1),
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsManager.appleIcon),
              horizontalSpacing(context.screenWidth / 35),
              Text('Apple pay'),
            ],
          ),
        ),
        verticalSpacing(context.screenHeight / 50),
        AppButton(
          onTap: () {},
          height: context.screenHeight / 19,
          color: ColorsManager.platinumGray,
          border: BoxBorder.all(color: ColorsManager.black, width: 0.1),
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsManager.googleIcon),
              horizontalSpacing(context.screenWidth / 35),
              Text('Google Pay'),
            ],
          ),
        ),
      ],
    );
  }
}
