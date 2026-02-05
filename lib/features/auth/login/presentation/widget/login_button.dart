import 'package:car_rental_app/config/responsive/size_config.dart';
import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/assets_manager.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:car_rental_app/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:car_rental_app/features/auth/login/presentation/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        AppButton(
          height: SizeConfig.heightButton,
          onTap: () {
            validationThenDoLoding(context: context);
          },
          widget: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
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
                  textAlign: TextAlign.center,
                  AppStrings.login,
                  style: TextStyles.font18WhiteBold,
                );
              }
            },
          ),
          style: TextStyles.font18WhiteBold,
        ),
        verticalSpacing(context.bodyHeight * 0.02),
        AppButton(
          onTap: () {
            context.pushNamedAndRemoveUntil(
              Routes.signUp,
              predicate: (_) => false,
            );
          },
          color: ColorsManager.platinumGray,
          widget: Text(
            textAlign: TextAlign.center,
            AppStrings.signUp,
            style: TextStyles.font18BlackBold,
          ),
          height: SizeConfig.heightButton,
          border: BoxBorder.all(color: ColorsManager.black),
        ),
      ],
    );
  }

  validationThenDoLoding({required BuildContext context}) {
    if (context.read<LoginCubit>().keyFrom.currentState!.validate()) {
      context.read<LoginCubit>().login();
    }
  }
}
