import 'package:car_rental_app/core/utils/app_colors.dart';
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
    return   SizedBox(
      // height: context.bodyHeight*0.00,
      child: Column(
        children: [
          AppButton(onTap: (){},
            height: context.screenHeight/19,
            color: AppColors.platinumGray,
            border: BoxBorder.all(color: AppColors.black,width: 0.1),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AssetsManager.appleIcon),
                horizontalSpacing(context.screenWidth/35),
                Text('Apple pay')
              ],
            ),
          ),
          verticalSpacing(context.screenHeight/50),
          AppButton(onTap: (){},
            height: context.screenHeight/19,
            color: AppColors.platinumGray,
            border: BoxBorder.all(color: AppColors.black,width: 0.1),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AssetsManager.googleIcon),
                horizontalSpacing(context.screenWidth/35),
                Text('Google Pay')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
