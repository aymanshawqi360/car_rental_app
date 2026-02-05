import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/widgets/app_text_form_field.dart';
import 'package:car_rental_app/features/auth/new_password/presentation/cubit/new_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordForm extends StatefulWidget {
  const NewPasswordForm({super.key});

  @override
  State<NewPasswordForm> createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends State<NewPasswordForm> {
  late TextEditingController containerConfirmPassword;
  late TextEditingController controllerPassword;
  @override
  void initState() {
    containerConfirmPassword = context
        .read<NewPasswordCubit>()
        .containerConfirmPassword;
    controllerPassword = context.read<NewPasswordCubit>().containerPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<NewPasswordCubit>().keyFrom,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.bodyHeight * 0.1,
            child: AppTextFormField(
              controller: controllerPassword,
              hintText: AppStrings.password,
              validator: (value) {
                if (value?.isEmpty ?? value == null) {
                  return AppStrings.thisPasswordIsRequired;
                }
              },
            ),
          ),

          AppTextFormField(
            controller: containerConfirmPassword,
            hintText: AppStrings.confirmPassword,
            validator: (value) {
              if (value?.isEmpty ?? value == null) {
                return AppStrings.thisConfirmPassword;
              }
            },
          ),
        ],
      ),
    );
  }
}
