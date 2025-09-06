import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_appbar.dart';
import 'package:car_rental_app/core/widgets/app_text_form_field.dart';
import 'package:car_rental_app/core/widgets/app_divider_and_or.dart';
import 'package:car_rental_app/features/auth/login/presentation/widget/login_button.dart';
import 'package:car_rental_app/features/auth/login/presentation/widget/remember_me_and_forgot_password.dart';
import 'package:car_rental_app/features/auth/login/presentation/widget/rich_text.dart';
import 'package:car_rental_app/features/auth/login/presentation/widget/social_media_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            verticalSpacing(context.bodyHeight * 0.06),
            SizedBox(
              height: context.bodyHeight * 0.14,
              child: Text(
                AppStrings.welcomeBackReayToHitTheRoad,

                style: TextStyles.font24BlackSemiBold,
              ),
            ),

            SizedBox(
              height: context.bodyHeight * 0.1,
              child: AppTextFormField(),
            ),

            AppTextFormField(hintText: AppStrings.password),
            SizedBox(
              height: context.bodyHeight * 0.1,
              child: RememberMeAndForgotPassword(),
            ),
            SizedBox(height: context.bodyHeight * 0.19, child: LoginButton()),
            SizedBox(
              height: context.bodyHeight * 0.07,
              child: AppDividerAndOr(),
            ),

            SizedBox(
              height: context.bodyHeight * 0.2,

              child: Column(children: [SocialMediaButton()]),
            ),
            RichTextWidget(),
          ],
        ),
      ),
    );
  }
}
