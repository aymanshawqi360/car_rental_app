import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_description_title.dart';
import 'package:car_rental_app/features/auth/reset_password/presentation/widget/creat_a_new_account.dart';
import 'package:car_rental_app/features/auth/reset_password/presentation/widget/reset_password_bloc_listener.dart';
import 'package:car_rental_app/features/auth/reset_password/presentation/widget/reset_password_button.dart';
import 'package:car_rental_app/features/auth/reset_password/presentation/widget/reset_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: (context.bodyHeight) * 0.55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppDescriptionTitle(
                    fristText: AppStrings.resetYourPassword,
                    fristTextStyle: TextStyles.font30BlackSemiBold,
                    lastText: AppStrings.specialDescriptionInThePassword,
                    lastTextStyle: TextStyles.font10GrayRegular,
                  ),
                  verticalSpacing(context.screenHeight * 0.04),
                  ResetPasswordForm(),
                  verticalSpacing(context.screenHeight * 0.04),
                  ResetPasswordButton(),
                ],
              ),
            ),
            SizedBox(
              height: context.bodyHeight * 0.45,
              child: CreatANewAccount(),
            ),
            ResetPasswordBlocListener(),
          ],
        ),
      ),
    );
  }
}
