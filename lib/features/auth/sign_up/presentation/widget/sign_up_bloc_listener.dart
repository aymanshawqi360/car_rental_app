import 'package:car_rental_app/core/utils/app_colors.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/singup_cubit.dart';
import 'package:car_rental_app/features/auth/sign_up/presentation/cubit/singup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SingUpCubit, SingUpState>(
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
  showDialog(
    context: context,

    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        // icon: const Icon(Icons.error, color: Colors.red, size: 32),
        title: Text(
          "Error",
          style: TextStyle(fontSize: 15.sp, color: Colors.red),
        ),

        content: Text(
          state.apiErrorModel.allSignUpError(),
          // style: TextStyles.font14DarkTaupeRegular,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Text("Cancel", style: TextStyle(color: ColorsManager.onyx)),
          ),
        ],
      );
    },
  );
}
