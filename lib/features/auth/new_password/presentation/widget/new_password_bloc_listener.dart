import 'package:car_rental_app/core/error/show_error_message.dart';
import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/features/auth/new_password/presentation/cubit/new_password_cubit.dart';
import 'package:car_rental_app/features/auth/new_password/presentation/cubit/new_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordBlocListener extends StatelessWidget {
  const NewPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewPasswordCubit, NewPasswordState>(
      listenWhen: (previous, current) =>
          current is NewPasswordFailure ||
          current is NewPasswordLoading ||
          current is NewPasswordSuccess,
      listener: (context, state) {
        if (state is NewPasswordLoading) {
        } else if (state is NewPasswordSuccess) {
          _buildStateSuccess(context: context);
        } else if (state is NewPasswordFailure) {
          _buildStateFailure(context: context, state: state);
        }
      },
      child: SizedBox.shrink(),
    );
  }

  _buildStateSuccess({required BuildContext context}) {
    context.pushNamedAndRemoveUntil(Routes.login, predicate: (_) => false);
  }

  _buildStateFailure({
    required BuildContext context,
    required NewPasswordFailure state,
  }) {
    return ShowErrorMessage.instance.showErrorMessage(
      context: context,
      errorMessage: state.errorMessage.allSignUpError(),
    );
  }
}
