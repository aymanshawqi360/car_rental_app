import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/core/utils/colors_manager.dart';
import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:car_rental_app/features/auth/login/presentation/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberMeAndForgotPassword extends StatelessWidget {
  const RememberMeAndForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.screenWidth * 0.01,
        right: context.screenWidth * 0.01,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              BlocBuilder<LoginCubit, LoginState>(
                buildWhen: (previous, current) => current is Remember,
                builder: (context, state) {
                  final cubit = context.read<LoginCubit>();

                  return SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Checkbox(
                      activeColor: ColorsManager.gray,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      value: cubit.isRemember,
                      onChanged: (value) {
                        cubit.remember(value ?? false);
                      },
                    ),
                  );
                },
              ),
              horizontalSpacing(context.screenWidth * 0.02),
              Text(AppStrings.rememberMe, style: TextStyles.font14GrayRegular),
            ],
          ),
          GestureDetector(
            onTap: () {
              context.pushNamedAndRemoveUntil(
                Routes.resetPassword,
                predicate: (_) => false,
              );
            },
            child: Text(
              AppStrings.forgotPassword,
              style: TextStyles.font14OnyxRegular,
            ),
          ),
        ],
      ),
    );
  }
}
