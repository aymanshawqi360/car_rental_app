import 'package:car_rental_app/core/error/show_error_message.dart';
import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SingUpLoading ||
          current is SingUpSuccess ||
          current is SingUpFailure,

      listener: (context, state) async {
        if (state is SingUpLoading) {
        } else if (state is SingUpSuccess) {
          context.pushNamedAndRemoveUntil(
            Routes.verificationCodeScreen,
            predicate: (_) => false,
          );
        } else if (state is SingUpFailure) {
          _setupErrorState(context, state);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}

void _setupErrorState(BuildContext context, SingUpFailure state) {
  ShowErrorMessage.instance.showErrorMessage(
    context: context,
    errorMessage: state.apiErrorModel.allSignUpError(),
  );
}
