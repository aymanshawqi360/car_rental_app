import 'package:car_rental_app/core/utils/extension.dart';
import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class SingUpForm extends StatelessWidget {
  const SingUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(hintText: "Full Name"),
        verticalSpacing(context.screenHeight * 0.02),
        AppTextFormField(hintText: "Email Address"),
        verticalSpacing(context.screenHeight * 0.02),
        AppTextFormField(hintText: "Password"),
        verticalSpacing(context.screenHeight * 0.02),
        AppTextFormField(hintText: "Country"),
      ],
    );
  }
}
