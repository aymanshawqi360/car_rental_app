import 'package:car_rental_app/config/responsive/size_config.dart';
import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/core/utils/app_colors.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        AppButton(
          height: SizeConfig.heightButton,
          onTap: () {},
          title: Text(
            textAlign: TextAlign.center,
            'Login',
            style: TextStyles.font18WhiteBold,
          ),
          style: TextStyles.font18WhiteBold,
        ),
        verticalSpacing(context.bodyHeight * 0.02),
        AppButton(
          onTap: () {
            context.pushNamedAndRemoveUntil(
              Routes.signUp,
              predicate: (_) => false,
            );
          },
          color: ColorsManager.platinumGray,
          title: Text(
            textAlign: TextAlign.center,
            'Sing up',
            style: TextStyles.font18BlackBold,
          ),
          height: SizeConfig.heightButton,
          border: BoxBorder.all(color: ColorsManager.black),
        ),
      ],
    );
  }
}
