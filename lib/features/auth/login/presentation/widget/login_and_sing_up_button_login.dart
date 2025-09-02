import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/core/utils/app_colors.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

class LoginAndSingUpButtonLogin extends StatelessWidget {
  const LoginAndSingUpButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: context.bodyHeight * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          AppButton(
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
            // style: TextStyles.font18BlackBold,
            border: BoxBorder.all(color: ColorsManager.black),
          ),
        ],
      ),
    );
  }
}
