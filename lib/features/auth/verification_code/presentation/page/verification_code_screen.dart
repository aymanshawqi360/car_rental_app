import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_appbar.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:car_rental_app/core/widgets/app_description_title.dart';
import 'package:car_rental_app/core/widgets/dont_have_an_account.dart';
import 'package:car_rental_app/features/auth/verification_code/presentation/widget/verification_code_field.dart';
import 'package:flutter/material.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(),
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          left: context.screenWidth * 0.03,
          right: context.screenWidth * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppDescriptionTitle(
              fristText: AppStrings.enterVerificationCode,
              lastText: AppStrings.weHaveSendACodeTo,
            ),
            verticalSpacing(context.screenHeight / 20),
            VerificationCodeField(),
            verticalSpacing(context.screenHeight * 0.02),
            AppButton(
              title: Text(
                AppStrings.continueButton,
                style: TextStyles.font18WhiteBold,
              ),
              onTap: () {},
            ),
            verticalSpacing(context.screenHeight / 20),
            DontHaveAnAccount(
              fristText: AppStrings.didntReceiveTheOtp,
              lateText: AppStrings.resend,
            ),
          ],
        ),
      ),
    );
  }
}
