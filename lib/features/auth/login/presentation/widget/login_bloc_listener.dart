import 'package:car_rental_app/core/error/show_error_message.dart';
import 'package:car_rental_app/core/routing/routes.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:car_rental_app/features/auth/login/presentation/cubit/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginFailure,
      listener: (context, state) {
        if (state is LoginLoading) {
          // buildStateLoading();
        } else if (state is LoginSuccess) {
          // _buildStateSuccess(context: context);
        } else if (state is LoginFailure) {
          _buildStateFailure(context: context, state: state);
        }
      },
      child: SizedBox.shrink(),
    );
  }

  Future<dynamic> _buildStateSuccess({required BuildContext context}) {
    return context.pushNamedAndRemoveUntil(
      Routes.emailVerificationCode,
      predicate: (_) => false,
    );
  }

  _buildStateFailure({
    required BuildContext context,
    required LoginFailure state,
  }) {
    return ShowErrorMessage.instance.showErrorMessage(
      context: context,
      errorMessage: state.errorMessage.allSignUpError(),
    );
  }
}
