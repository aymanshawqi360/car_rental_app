import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_appbar.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:car_rental_app/core/widgets/app_description_title.dart';
import 'package:car_rental_app/core/widgets/app_loading_button.dart';
import 'package:car_rental_app/features/auth/new_password/presentation/cubit/new_password_cubit.dart';
import 'package:car_rental_app/features/auth/new_password/presentation/cubit/new_password_state.dart';
import 'package:car_rental_app/features/auth/new_password/presentation/widget/navigate_button.dart';
import 'package:car_rental_app/features/auth/new_password/presentation/widget/new_password_bloc_listener.dart';
import 'package:car_rental_app/features/auth/new_password/presentation/widget/new_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

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
              height: (context.bodyHeight) * 0.55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppDescriptionTitle(
                    fristText: AppStrings.newPassword,
                    fristTextStyle: TextStyles.font30BlackSemiBold,
                    lastText: AppStrings.setNewPassword,
                    lastTextStyle: TextStyles.font10GrayRegular,
                  ),
                  verticalSpacing(context.screenHeight * 0.04),
                  NewPasswordForm(),
                  verticalSpacing(context.screenHeight * 0.04),
                  AppButton(
                    onTap: () {
                      validactionThenDoNewPasswrod(context: context);
                    },
                    widget: BlocBuilder<NewPasswordCubit, NewPasswordState>(
                      builder: (context, state) {
                        if (state is NewPasswordLoading) {
                          return AppLoadingButton();
                        } else {
                          return Text(
                            textAlign: TextAlign.center,
                            AppStrings.continueButton,
                            style: TextStyles.font18WhiteBold,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.bodyHeight * 0.45,
              child: NavigateButton(),
            ),
            NewPasswordBlocListener(),
          ],
        ),
      ),
    );
  }

  validactionThenDoNewPasswrod({required BuildContext context}) {
    if (context.read<NewPasswordCubit>().keyFrom.currentState!.validate()) {
      context.read<NewPasswordCubit>().getNewPassword();
    }
  }
}
