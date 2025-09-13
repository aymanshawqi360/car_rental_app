import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/styles.dart';
import 'package:car_rental_app/core/widgets/app_text_form_field.dart';
import 'package:car_rental_app/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController controllerPassword;
  late TextEditingController controllerEmail;
  @override
  void initState() {
    final cunit = context.read<LoginCubit>();
    controllerEmail = cunit.controllerEmail;
    controllerPassword = cunit.controllerPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().keyFrom,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.bodyHeight * 0.14,
            child: Text(
              textAlign: TextAlign.left,
              AppStrings.welcomeBackReayToHitTheRoad,

              style: TextStyles.font24BlackSemiBold,
            ),
          ),
          SizedBox(
            height: context.bodyHeight * 0.1,
            child: AppTextFormField(
              controller: controllerEmail,
              validator: (value) {
                if (value?.isEmpty ?? value == null) {
                  return AppStrings.thisEmailIsRequired;
                }
              },
            ),
          ),

          AppTextFormField(
            controller: controllerPassword,
            hintText: AppStrings.password,
            validator: (value) {
              if (value?.isEmpty ?? value == null) {
                return AppStrings.thisPasswordIsRequired;
              }
            },
          ),
        ],
      ),
    );
  }
}
