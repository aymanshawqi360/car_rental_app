import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:car_rental_app/core/widgets/app_loading_button.dart';
import 'package:car_rental_app/features/auth/email_verification/presentation/cubit/email_verification_cubit.dart';
import 'package:car_rental_app/features/auth/email_verification/presentation/cubit/email_verification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailVerificationContinueButton extends StatelessWidget {
  const EmailVerificationContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailVerificationCubit, EmailVerificationState>(
      builder: (context, state) {
        return AppButton(
          widget: (state is EmailVerificationSuccess)
              ? Text(
                  textAlign: TextAlign.center,
                  AppStrings.continueButton,
                  style: TextStyles.font18WhiteBold,
                )
              : AppLoadingButton(),
          onTap: () {
            context.read<EmailVerificationCubit>().emailVerification();
          },
        );
      },
    );
  }
}
