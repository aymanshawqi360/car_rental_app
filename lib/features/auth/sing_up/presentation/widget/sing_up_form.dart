import 'package:car_rental_app/core/utils/spacing.dart';
import 'package:car_rental_app/core/widgets/app_country_dropdown.dart';
import 'package:car_rental_app/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingUpForm extends StatelessWidget {
  const SingUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(hintText: "Full Name"),
        verticalSpacing(15.h),
        AppTextFormField(hintText: "Email Address"),
        verticalSpacing(15.h),
        AppTextFormField(hintText: "Password"),
        verticalSpacing(15.h),
        AppCountryDropdown(),
      ],
    );
  }
}
