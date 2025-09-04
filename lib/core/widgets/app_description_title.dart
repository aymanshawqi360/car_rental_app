import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AppDescriptionTitle extends StatelessWidget {
  final String? fristText;
  final String? lastText;
  final TextStyle? fristTextStyle;
  final TextStyle? lastTextStyle;
  const AppDescriptionTitle({
    super.key,
    this.fristText,
    this.lastText,
    this.fristTextStyle,
    this.lastTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          fristText ?? AppStrings.resetYourPassword,
          style: fristTextStyle ?? TextStyles.font30BlackSemiBold,
        ),
        verticalSpacing(context.screenHeight * 0.01),
        Text(
          textAlign: TextAlign.center,
          lastText ?? AppStrings.specialDescriptionInThePassword,
          style: lastTextStyle ?? TextStyles.font12GrayRegular,
        ),
      ],
    );
  }
}
