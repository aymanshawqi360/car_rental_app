import 'dart:developer';

import 'package:car_rental_app/core/error/show_error_message.dart';
import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/features/auth/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:car_rental_app/features/auth/reset_password/presentation/cubit/reset_password_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordBlocListener extends StatelessWidget {
  const ResetPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listenWhen: (previous, current) =>
          current is ResetPasswordLoading ||
          current is ResetPasswordSuccess ||
          current is ResetPasswordFailure,
      listener: (context, state) {
        if (state is ResetPasswordLoading) {
          log("ResetPasswordLoading");
        } else if (state is ResetPasswordSuccess) {
          log("message");
          _buildStateSuccess(context: context);
        } else if (state is ResetPasswordFailure) {
          log("ResetPasswordFailure");
          _buildStateFailure(context: context, state: state);
        }
      },
      child: SizedBox.shrink(),
    );
  }

  _buildStateFailure({
    required BuildContext context,
    required ResetPasswordFailure state,
  }) {
    ShowErrorMessage.instance.showErrorMessage(
      context: context,
      errorMessage: state.errorMessage.allSignUpError(),
    );
  }

  Future<dynamic> _buildStateSuccess({required BuildContext context}) {
    return context.pushNamedAndRemoveUntil(
      Routes.emailVerificationCode,
      predicate: (_) => false,
    );
  }
}
