import 'package:car_rental_app/config/responsive/size_config.dart';
import 'package:car_rental_app/core/utils/app_colors.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_appbar.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:car_rental_app/core/widgets/app_description_title.dart';
import 'package:car_rental_app/core/widgets/app_dont_have_an_account.dart';
import 'package:car_rental_app/features/auth/verification_code/presentation/cubit/verification_code_cubit.dart';
import 'package:car_rental_app/features/auth/verification_code/presentation/cubit/verification_code_state.dart';
import 'package:car_rental_app/features/auth/verification_code/presentation/widget/verification_code_bloc_listener.dart';
import 'package:car_rental_app/features/auth/verification_code/presentation/widget/verification_code_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppAppbar(),
      body: Padding(
        padding: EdgeInsetsGeometry.only(
          left: context.screenWidth * 0.03,
          right: context.screenWidth * 0.03,
        ),
        child: Column(
          children: [
            SizedBox(
              height: context.bodyHeight * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: context.screenWidth * 0.05),

                    child: Text(AppStrings.skip),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: context.bodyHeight * 0.9,
              child: Column(
                children: [
                  BlocBuilder<VerificationCodeCubit, VerificationCodeState>(
                    buildWhen: (previous, current) =>
                        current is ConfirmVerifyCodePhone,
                    builder: (context, state) {
                      return AppDescriptionTitle(
                        fristText: AppStrings.enterVerificationCode,
                        lastText:
                            AppStrings.weHaveSendACodeTo +
                            ((state is ConfirmVerifyCodePhone)
                                ? state.phone
                                : ""),
                      );
                    },
                  ),
                  verticalSpacing(context.screenHeight / 20),
                  VerificationCodeField(),
                  verticalSpacing(context.screenHeight * 0.02),
                  AppButton(
                    height: SizeConfig.heightButton,
                    widget:
                        BlocBuilder<
                          VerificationCodeCubit,
                          VerificationCodeState
                        >(
                          builder: (context, state) {
                            if (state is ConfirmVerifyCodeLoading) {
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
                                AppStrings.continueButton,
                                style: TextStyles.font18WhiteBold,
                              );
                            }
                          },
                        ),
                    onTap: () {
                      context.read<VerificationCodeCubit>().confirmVerifyCode();
                    },
                  ),
                  VerificationCodeBlocListener(),
                  verticalSpacing(context.screenHeight / 20),
                  AppDontHaveAnAccount(
                    fristText: AppStrings.didntReceiveTheOtp,
                    lateText: AppStrings.resend,
                    onTap: () async {
                      context.read<VerificationCodeCubit>().checkIfPhoneNumber(
                        // phone:
                        //     await SecureStorage.getData(token: Token.phone) ??
                        //     '',
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
