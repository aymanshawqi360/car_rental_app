import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_text_form_field.dart';
import 'package:car_rental_app/core/widgets/app_divider_and_or.dart';
import 'package:car_rental_app/core/widgets/appbar_widget.dart';
import 'package:car_rental_app/features/auth/login/presentation/widget/login_and_sing_up_button_login.dart';
import 'package:car_rental_app/features/auth/login/presentation/widget/remember_me_and_forgot_password.dart';
import 'package:car_rental_app/features/auth/login/presentation/widget/rich_text.dart';
import 'package:car_rental_app/features/auth/login/presentation/widget/social_media_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          left: context.screenWidth * 0.03,
          right: context.screenWidth * 0.03,
          // top: context.bodyHeight * 0.02,
          // bottom: context.bodyHeight * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            AppbarWidget(),
            SizedBox(
              height: context.bodyHeight * 0.13,
              child: Text(
                AppStrings.welcomeBackReayToHitTheRoad,

                style: TextStyles.font24BlackSemiBold,
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  AppTextFormField(),
                  verticalSpacing(context.bodyHeight * 0.02),
                  AppTextFormField(hintText: AppStrings.password),
                ],
              ),
            ),
            RememberMeAndForgotPassword(),
            LoginAndSingUpButtonLogin(),
            AppDividerAndOr(),
            verticalSpacing(context.bodyHeight * 0.02),
            SocialMediaButton(),
            verticalSpacing(context.bodyHeight * 0.1),
            RichTextWidget(),
          ],
        ),
      ),
    );
  }
}
