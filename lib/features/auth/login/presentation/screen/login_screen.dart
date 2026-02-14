import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/widgets/app_appbar.dart';
import 'package:car_rental_app/core/widgets/app_divider_and_or.dart';
import 'package:car_rental_app/features/auth/login/presentation/widget/login_form.dart';
import 'package:car_rental_app/features/auth/login/presentation/widget/login_bloc_listener.dart';
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
      appBar:const AppAppbar(),
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsGeometry.only(
                left: context.screenWidth * 0.03,
                right: context.screenWidth * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  verticalSpacing(context.bodyHeight * 0.06),
                  const LoginForm(),
                  SizedBox(
                    height: context.bodyHeight * 0.1,
                    child: RememberMeAndForgotPassword(),
                  ),
                  SizedBox(
                    height: context.bodyHeight * 0.19,
                    child: LoginButton(),
                  ),
                  SizedBox(
                    height: context.bodyHeight * 0.07,
                    child: AppDividerAndOr(),
                  ),

                  SizedBox(
                    height: context.bodyHeight * 0.2,

                    child: Column(children: [const SocialMediaButton()]),
                  ),
                  const RichTextWidget(),
                  const LoginBlocListener(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
