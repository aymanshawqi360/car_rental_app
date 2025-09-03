import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ResetPasswordDescription extends StatelessWidget {
  const ResetPasswordDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.resetYourPassword,
          style: TextStyles.font30BlackSemiBold,
        ),
        verticalSpacing(context.screenHeight * 0.01),
        Text(
          textAlign: TextAlign.center,
          AppStrings.specialDescriptionInThePassword,
          style: TextStyles.font13GrayRegular,
        ),
      ],
    );
  }
}
