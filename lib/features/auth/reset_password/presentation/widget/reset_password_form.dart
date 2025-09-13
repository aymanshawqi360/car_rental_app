import 'package:car_rental_app/core/utils/app_strings.dart';
import 'package:car_rental_app/core/widgets/app_text_form_field.dart';
import 'package:car_rental_app/features/auth/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  late TextEditingController controllerEmail;

  @override
  void initState() {
    controllerEmail = context.read<ResetPasswordCubit>().controllerEmail;
    super.initState();
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ResetPasswordCubit>().fromKey,
      child: AppTextFormField(
        validator: (value) {
          if (value?.isEmpty ?? value == null) {
            return AppStrings.thisPasswordIsRequired;
          }
        },
        controller: controllerEmail,
        hintText: AppStrings.email,
      ),
    );
  }
}
