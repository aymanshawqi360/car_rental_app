import 'package:car_rental_app/core/constants/show_local_notifications_service.dart';
import 'package:car_rental_app/core/error/show_error_message.dart';
import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/features/auth/verification_code/presentation/cubit/verification_code_cubit.dart';
import 'package:car_rental_app/features/auth/verification_code/presentation/cubit/verification_code_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCodeBlocListener extends StatelessWidget {
  const VerificationCodeBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationCodeCubit, VerificationCodeState>(
      listenWhen: (previous, current) =>
          current is CheckIfPhoneNumberLoading ||
          current is CheckIfPhoneNumberFailure ||
          current is CheckIfPhoneNumberSuccess ||
          current is ConfirmVerifyCodeLoading ||
          current is ConfirmVerifyCodeSuccess ||
          current is ConfirmVerifyCodeFailure,
      listener: (context, state) {
        if (state is ConfirmVerifyCodeLoading) {
        } else if (state is ConfirmVerifyCodeFailure) {
          _buildConfirmVerifyCodeFailureState(state: state, context: context);
        } else if (state is ConfirmVerifyCodeSuccess) {
          context.pushNamedAndRemoveUntil(
            Routes.homeScreen,
            predicate: (_) => false,
          );
        } else if (state is CheckIfPhoneNumberSuccess) {
          _buildCheckIfPhoneNumberSuccessState(state: state);
        }
      },
      child: SizedBox(),
    );
  }

  _buildCheckIfPhoneNumberSuccessState({
    required CheckIfPhoneNumberSuccess state,
  }) {
    ShowLocalNotificationService.showBasicNotification(
      code: state.code,
      message: state.message,
    );
  }

  _buildConfirmVerifyCodeFailureState({
    required ConfirmVerifyCodeFailure state,
    required BuildContext context,
  }) {
    ShowErrorMessage.instance.showErrorMessage(
      context: context,
      errorMessage: state.errorMessage.allSignUpError(),
    );
  }
}
