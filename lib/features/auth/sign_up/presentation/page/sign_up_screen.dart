import 'package:car_rental_app/config/responsive/size_config.dart';
import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/core/utils/app_colors.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_appbar.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:car_rental_app/core/widgets/app_divider_and_or.dart';
import 'package:car_rental_app/core/widgets/dont_have_an_account.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/singup_cubit.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/singup_state.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/widget/sign_up_bloc_listener.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/widget/sign_up_form.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/widget/social_media_button_sing_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          left: context.screenWidth * 0.03,
          right: context.screenWidth * 0.03,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  verticalSpacing(context.bodyHeight * 0.05),
                  SizedBox(
                    height: context.bodyHeight * 0.1,
                    child: Text(
                      AppStrings.signUp,
                      style: TextStyles.font30BlackSemiBold,
                    ),
                  ),
                  SignUpForm(),
                  verticalSpacing(context.bodyHeight * 0.04),
                  Column(
                    children: [
                      AppButton(
                        height: SizeConfig.heightButton,
                        onTap: () {
                          validationThenDoSingUp(context: context);
                        },
                        title: BlocBuilder<SingUpCubit, SingUpState>(
                          builder: (context, state) {
                            if (state is SingupLoading) {
                              return Lottie.asset(
                                AssetsManager.loading,
                                height: 36.5.h,
                                width: 36.5.w,
                                delegates: LottieDelegates(
                                  values: [
                                    ValueDelegate.color(const [
                                      '**',
                                    ], value: ColorsManager.white),
                                  ],
                                ),
                              );
                            } else {
                              return Text(
                                AppStrings.signUp,
                                style: TextStyles.font18WhiteBold,
                              );
                            }
                          },
                        ),
                      ),
                      verticalSpacing(context.screenHeight * 0.03),
                      AppButton(
                        onTap: () {
                          context.pushNamedAndRemoveUntil(
                            Routes.login,
                            predicate: (_) => false,
                          );
                        },
                        height: SizeConfig.heightButton,
                        color: ColorsManager.platinumGray,
                        border: BoxBorder.all(
                          width: 1,
                          color: ColorsManager.black,
                        ),
                        title: Text(
                          AppStrings.login,
                          style: TextStyles.font18BlackBold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.bodyHeight * 0.1,
                    child: AppDividerAndOr(),
                  ),

                  SizedBox(
                    height: context.bodyHeight * 0.2,
                    child: SocialMediaButtonSigbUp(),
                  ),

                  SizedBox(
                    height: context.bodyHeight * 0.1,
                    child: DontHaveAnAccount(
                      fristText: AppStrings.dontHaveAnAccountLogin,
                      lateText: AppStrings.login,
                    ),
                  ),
                  SignUpBlocListener(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validationThenDoSingUp({required BuildContext context}) {
    if (context.read<SingUpCubit>().keyFrom.currentState!.validate()) {
      context.read<SingUpCubit>().singUp();
    }
  }
}
