import 'package:car_rental_app/core/error/show_error_message.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SingUpState>(
      listenWhen: (previous, current) =>
          current is SingupLoading ||
          current is SingupSuccess ||
          current is SingupFailure,
      listener: (context, state) {
        if (state is SingupLoading) {
          // _setupLoadingSate(context);
        } else if (state is SingupSuccess) {
          context.pop();
          // context.pushNamedAndRemoveUntil(
          //   Routes.buttonNavigateBetweenScreen,
          //   predicate: (_) => false,
          // );
        } else if (state is SingupFailure) {
          // context.pop();
          _setupErrorState(context, state);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}

void _setupErrorState(BuildContext context, SingupFailure state) {
  // context.pop();
  ShowErrorMessage.instance.showErrorMessage(
    context: context,
    errorMessage: state.apiErrorModel.allSignUpError(),
  );
}
