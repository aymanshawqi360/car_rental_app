import 'package:car_rental_app/config/responsive/size_config.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_button.dart';
import 'package:car_rental_app/core/widgets/app_loading_button.dart';
import 'package:car_rental_app/features/auth/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:car_rental_app/features/auth/reset_password/presentation/cubit/reset_password_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      height: SizeConfig.heightButton,
      onTap: () {
        validattionThenDoResetPassword(context: context);
      },

      widget: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
        builder: (context, state) {
          if (state is ResetPasswordLoading) {
            return AppLoadingButton();
          } else {
            return Text("Continue", style: TextStyles.font18WhiteBold);
          }
        },
      ),
    );
  }

  validattionThenDoResetPassword({required BuildContext context}) {
    if (context.read<ResetPasswordCubit>().fromKey.currentState!.validate()) {
      context.read<ResetPasswordCubit>().resetPassword();
    }
  }
}
