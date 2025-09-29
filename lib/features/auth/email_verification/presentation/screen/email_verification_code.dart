import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:car_rental_app/core/widgets/app_description_title.dart';
import 'package:car_rental_app/features/auth/email_verification/cubit/email_verification_cubit.dart';
import 'package:car_rental_app/features/auth/email_verification/widget/create_new_accout.dart';
import 'package:car_rental_app/features/auth/email_verification/widget/intl_phone_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class EmailVerificationCode extends StatelessWidget {
  const EmailVerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(AssetsManager.qentCar, width: 33, height: 33),
            horizontalSpacing(context.screenWidth * 0.02),
            SvgPicture.asset(AssetsManager.qent, width: 20, height: 20),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          left: context.screenWidth * 0.03,
          right: context.screenWidth * 0.03,
        ),
        child: Column(
          children: [
            SizedBox(
              height: (context.bodyHeight) * 0.55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppDescriptionTitle(
                    fristText: AppStrings.emailVerification,
                    fristTextStyle: TextStyles.font30BlackSemiBold,
                    lastText: AppStrings.enterThefourCodeDigitVerificationCode,
                    lastTextStyle: TextStyles.font12GrayRegular,
                  ),
                  verticalSpacing(context.screenHeight * 0.04),
                  IntlPhoneFieldWidget(),
                  verticalSpacing(context.screenHeight * 0.04),
                  AppButton(
                    onTap: () {
                      context
                          .read<EmailVerificationCubit>()
                          .emailVerification();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.bodyHeight * 0.45,
              child: CreateNewAccout(),
            ),
          ],
        ),
      ),
    );
  }
}
